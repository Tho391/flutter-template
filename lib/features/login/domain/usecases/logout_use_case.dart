// lib/features/login/domain/usecases/logout_use_case.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/login_repository_impl.dart';
import '../repositories/login_repository.dart';

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  final repository = ref.read(loginRepositoryProvider);
  return LogoutUseCase(repository);
});

class LogoutUseCase {
  final LoginRepository repository;

  LogoutUseCase(this.repository);

  Future<void> execute() async {
    return repository.logout();
  }
}
