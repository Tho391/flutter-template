import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/constants/api_endpoints.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_client.dart';
import '../models/profile_model.dart';

final profileDataSourceProvider = Provider<ProfileDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return ProfileDataSource(dio);
});

class ProfileDataSource {
  final Dio dio;

  ProfileDataSource(this.dio);

  Future<Either<Failure, ProfileModel>> getProfile(String token) async {
    try {
      final response = await dio.get(
        ApiEndpoints.userProfile,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
          extra: {'withCredentials': true},
        ),
      );

      if (response.statusCode == 200) {
        return Right(ProfileModel.fromJson(response.data));
      } else {
        return Left(Failure('Failed to fetch profile'));
      }
    } catch (e) {
      return Left(Failure('An error occurred: $e'));
    }
  }
}
