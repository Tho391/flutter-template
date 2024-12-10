import 'package:fpdart/fpdart.dart';

import '../datasources/login_data_source.dart';
import '../models/credentials.dart';

class LoginRepositoryImpl {
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl(this.loginDataSource);

  Future<Either<String, String>> login(Credentials credentials) async {
    return loginDataSource.login(credentials);
  }
}
