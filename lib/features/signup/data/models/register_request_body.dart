import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  @JsonKey(name: 'name')
  final String username;
  final String email;
  final String password;
  final String phone;
  final int gender;
  @JsonKey(name: 'password_confirmation')
  final String confirmPassword;

  RegisterRequestBody(
      {required this.phone,
      required this.gender,
      required this.username,
      required this.email,
      required this.password,
      required this.confirmPassword});

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
