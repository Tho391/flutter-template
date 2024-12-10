import 'package:fpdart/fpdart.dart';

import '../entities/user.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<Either<String, String>> execute(User user) async {
    return loginRepository.login(user);
  }
}
