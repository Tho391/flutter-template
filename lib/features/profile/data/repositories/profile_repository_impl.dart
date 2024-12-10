import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_data_source.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final dataSource = ref.read(profileDataSourceProvider);
  return ProfileRepositoryImpl(dataSource);
});

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Profile>> getProfile(String token) async {
    final result = await dataSource.getProfile(token);
    return result.fold(
      (failure) => Left(failure),
      (profileModel) => Right(Profile(
        id: profileModel.id,
        username: profileModel.username,
        email: profileModel.email,
        firstName: profileModel.firstName,
        lastName: profileModel.lastName,
        gender: profileModel.gender,
        image: profileModel.image,
      )),
    );
  }
}
