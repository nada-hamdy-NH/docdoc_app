// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestBody _$RegisterRequestBodyFromJson(Map<String, dynamic> json) =>
    RegisterRequestBody(
      phone: json['phone'] as String,
      gender: (json['gender'] as num).toInt(),
      username: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$RegisterRequestBodyToJson(
        RegisterRequestBody instance) =>
    <String, dynamic>{
      'name': instance.username,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'gender': instance.gender,
      'password_confirmation': instance.confirmPassword,
    };
