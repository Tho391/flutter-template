import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/login_model.dart';

part '../../../../generated/freezed/features/login/domain/entities/user.freezed.dart';
part '../../../../generated/freezed/features/login/domain/entities/user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String gender,
    required String image,
    required String accessToken,
    required String refreshToken,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromLoginModel(LoginModel loginModel) {
    return User(
      id: loginModel.id,
      username: loginModel.username,
      email: loginModel.email,
      firstName: loginModel.firstName,
      lastName: loginModel.lastName,
      gender: loginModel.gender,
      image: loginModel.image,
      accessToken: loginModel.accessToken,
      refreshToken: loginModel.refreshToken,
    );
  }
}
