import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/user.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> login({
    required String username,
    required String password,
  });

  Future<void> logout();
}
