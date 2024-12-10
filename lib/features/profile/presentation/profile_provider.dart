// lib/features/profile/presentation/profile_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/profile/presentation/profile_state.dart';

import '../domain/usecases/get_profile_use_case.dart';

final profileProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  final getProfileUseCase = ref.read(getProfileUseCaseProvider);
  return ProfileNotifier(getProfileUseCase);
});

class ProfileNotifier extends StateNotifier<ProfileState> {
  final GetProfileUseCase getProfileUseCase;

  ProfileNotifier(this.getProfileUseCase) : super(ProfileState());

  Future<void> fetchProfile(String token) async {
    state = state.copyWith(isLoading: true);

    final result = await getProfileUseCase.execute(token);
    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
      },
      (profile) {
        state = state.copyWith(
          isLoading: false,
          profile: profile,
        );
      },
    );
  }
}
