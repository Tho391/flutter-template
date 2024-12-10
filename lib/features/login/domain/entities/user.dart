import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/freezed/features/login/domain/entities/user.freezed.dart';
part '../../../../generated/freezed/features/login/domain/entities/user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String username,
    required String password,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
