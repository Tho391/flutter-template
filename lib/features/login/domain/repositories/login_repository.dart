import 'package:fpdart/fpdart.dart';

import '../../domain/entities/user.dart';

abstract class LoginRepository {
  Future<Either<String, String>> login(User user);
}
