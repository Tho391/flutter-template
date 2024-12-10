import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/constants/api_endpoints.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_client.dart';
import '../models/credential_model.dart';
import '../models/login_model.dart';

final loginDataSourceProvider = Provider<LoginDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return LoginDataSource(dio);
});

class LoginDataSource {
  final Dio dio;

  LoginDataSource(this.dio);

  Future<Either<Failure, LoginModel>> login(CredentialModel credentials) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: {
          'username': credentials.username,
          'password': credentials.password,
          'expiresInMins': 30, // Optional field
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json', // Setting content type
          },
          extra: {'withCredentials': true},
        ),
      );

      // Check the response status and map it to the LoginModel
      if (response.statusCode == 200) {
        final loginModel = LoginModel.fromJson(response.data);
        return Right(loginModel);
      } else if (response.statusCode == 401) {
        // Handle 401 Unauthorized error, get the message from response.data
        final errorMessage =
            response.data['message'] ?? 'Access Token is required';
        return Left(Failure(errorMessage));
      } else {
        // Handle API response failure for other status codes
        return Left(
            Failure('Login failed with status code: ${response.statusCode}'));
      }
    } catch (e) {
      // Handle DioError or network errors
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          // Handle 401 error explicitly
          final errorMessage =
              e.response?.data['message'] ?? 'Access Token is required';
          return Left(Failure(errorMessage));
        } else {
          return Left(Failure('Network error: ${e.message}'));
        }
      }
      return Left(Failure('An unknown error occurred'));
    }
  }
}
