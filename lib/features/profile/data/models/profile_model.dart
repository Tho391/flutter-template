import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/freezed/features/profile/data/models/profile_model.freezed.dart';
part '../../../../generated/freezed/features/profile/data/models/profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const ProfileModel._(); // Empty constructor

  const factory ProfileModel({
    required int id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String maidenName,
    required int age,
    required String gender,
    required String phone,
    required String birthDate,
    required String image,
    required String bloodGroup,
    required double height,
    required double weight,
    required String eyeColor,
    required Hair hair,
    required String ip,
    required Address address,
    required String macAddress,
    required String university,
    required Bank bank,
    required Company company,
    required String ein,
    required String ssn,
    required String userAgent,
    required Crypto crypto,
    required String role,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@freezed
class Hair with _$Hair {
  const Hair._(); // Empty constructor

  const factory Hair({
    required String color,
    required String type,
  }) = _Hair;

  factory Hair.fromJson(Map<String, dynamic> json) => _$HairFromJson(json);
}

@freezed
class Address with _$Address {
  const Address._(); // Empty constructor

  const factory Address({
    required String address,
    required String city,
    required String state,
    required String stateCode,
    required String postalCode,
    required Coordinates coordinates,
    required String country,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
class Coordinates with _$Coordinates {
  const Coordinates._(); // Empty constructor

  const factory Coordinates({
    required double lat,
    required double lng,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}

@freezed
class Bank with _$Bank {
  const Bank._(); // Empty constructor

  const factory Bank({
    required String cardExpire,
    required String cardNumber,
    required String cardType,
    required String currency,
    required String iban,
  }) = _Bank;

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);
}

@freezed
class Company with _$Company {
  const Company._(); // Empty constructor

  const factory Company({
    required String department,
    required String name,
    required String title,
    required Address address,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}

@freezed
class Crypto with _$Crypto {
  const Crypto._(); // Empty constructor

  const factory Crypto({
    required String coin,
    required String wallet,
    required String network,
  }) = _Crypto;

  factory Crypto.fromJson(Map<String, dynamic> json) => _$CryptoFromJson(json);
}
