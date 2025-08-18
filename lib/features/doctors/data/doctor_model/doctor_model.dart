import 'data.dart';

class DoctorModel {
  String? message;
  Data? data;
  bool? status;
  int? code;

  DoctorModel({this.message, this.data, this.status, this.code});

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
      message: json['message'] as String?,
      data: json['data'] != null && json['data'] is Map<String, dynamic>
          ? Data.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      status: json['status'] as bool?,
      code: json['code'] as int?,
    );

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
        'status': status,
        'code': code,
      };
}
