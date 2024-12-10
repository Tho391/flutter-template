import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/freezed/features/login/data/models/credential_model.freezed.dart';
part '../../../../generated/freezed/features/login/data/models/credential_model.g.dart';

@freezed
class CredentialModel with _$CredentialModel {
  const factory CredentialModel({
    required String username,
    required String password,
  }) = _CredentialModel;

  const CredentialModel._();

  factory CredentialModel.fromJson(Map<String, dynamic> json) =>
      _$CredentialModelFromJson(json);
}