import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/usecases/login_use_case.dart';

class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  LoginState({
    required this.isLoading,
    required this.isSuccess,
    this.errorMessage,
  });

  LoginState.initial()
      : isLoading = false,
        isSuccess = false,
        errorMessage = null;

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class LoginStateNotifier extends StateNotifier<LoginState> {
  final LoginUseCase loginUseCase;

  LoginStateNotifier(this.loginUseCase) : super(LoginState.initial());

  Future<void> login(String username, String password) async {
    state = state.copyWith(isLoading: true);

    final result = await loginUseCase.execute(
      username: username,
      password: password,
    );

    result.fold(
          (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
      },
          (user) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
        );
      },
    );
  }
}

final loginStateProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  final loginUseCase = ref.read(loginUseCaseProvider);
  return LoginStateNotifier(loginUseCase);
});
