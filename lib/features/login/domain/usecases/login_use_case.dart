import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../entities/user.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<Either<Failure, User>> execute({
    required String username,
    required String password,
  }) async {
    return await loginRepository.login(username: username, password: password);
  }
}

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final loginRepository = ref.read(loginRepositoryProvider);
  return LoginUseCase(loginRepository);
});