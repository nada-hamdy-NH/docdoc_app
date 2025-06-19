import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final String? message;
  @JsonKey(name: "data")
  UserData? userData;
  final bool? status;
  final int? code;

  RegisterResponse(this.message, this.userData, this.status, this.code);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final String? token;
  @JsonKey(name: "username")
  final String? userName;
  UserData(this.token, this.userName);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
