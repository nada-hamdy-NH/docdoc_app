import 'datum.dart';

class ProfileModel {
  String? message;
  List<Info>? data;
  bool? status;
  int? code;

  ProfileModel({this.message, this.data, this.status, this.code});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Info.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as bool?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
        'status': status,
        'code': code,
      };
}
