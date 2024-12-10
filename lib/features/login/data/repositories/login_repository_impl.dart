import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/constants/app_constants.dart';
import 'package:flutter_template/core/storage/shared_preferences_helper.dart';
import 'package:flutter_template/features/login/data/models/credential_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, User>> login(
      {required String username, required String password}) async {
    final credentialModel =
        CredentialModel(username: username, password: password);
    final result = await dataSource.login(credentialModel);
    return result.fold(
      (failure) => Left(failure),
      (loginModel) {
        _saveToken(loginModel.accessToken);
        return Right(User.fromLoginModel(loginModel));
      },
    );
  }

  // Method to save the token in SharedPreferences
  Future<void> _saveToken(String accessToken) async {
    await SharedPreferencesHelper.setString(
        AppConstants.accessTokenKey, accessToken);
  }

  @override
  Future<void> logout() async {
    await SharedPreferencesHelper.clearToken();
  }
}

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  final loginDataSource = ref.read(loginDataSourceProvider);
  return LoginRepositoryImpl(loginDataSource);
});
