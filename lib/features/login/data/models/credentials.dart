import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/freezed/features/login/data/models/credentials.freezed.dart';
part '../../../../generated/freezed/features/login/data/models/credentials.g.dart';

@freezed
class Credentials with _$Credentials {
  const factory Credentials({
    required String username,
    required String password,
  }) = _Credentials;

  const Credentials._();

  factory Credentials.fromJson(Map<String, dynamic> json) =>
      _$CredentialsFromJson(json);
}
