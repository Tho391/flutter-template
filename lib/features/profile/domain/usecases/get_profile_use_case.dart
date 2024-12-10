import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';


final getProfileUseCaseProvider = Provider<GetProfileUseCase>((ref) {
  final dio = ref.read(profileRepositoryProvider);
  return GetProfileUseCase(dio);
});

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<Either<Failure, Profile>> execute(String token) {
    return repository.getProfile(token);
  }
}
