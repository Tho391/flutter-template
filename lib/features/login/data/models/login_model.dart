import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/freezed/features/login/data/models/login_model.freezed.dart';
part '../../../../generated/freezed/features/login/data/models/login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    required int id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String gender,
    required String image,
    required String accessToken,
    required String refreshToken,
  }) = _LoginModel;

  const LoginModel._();

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
