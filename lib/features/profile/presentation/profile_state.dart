import '../domain/entities/profile.dart';

// State class to represent different states of profile data
class ProfileState {
  final bool isLoading;
  final Profile? profile;
  final String? errorMessage;

  ProfileState({this.isLoading = false, this.profile, this.errorMessage});

  ProfileState copyWith({
    bool? isLoading,
    Profile? profile,
    String? errorMessage,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      profile: profile ?? this.profile,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
