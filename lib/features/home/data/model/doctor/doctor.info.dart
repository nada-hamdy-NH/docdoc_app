import 'doctor_info.dart';

class Doctor {
  String? message;
  DoctorInfo? data;
  bool? status;
  int? code;

  Doctor({this.message, this.data, this.status, this.code});

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : DoctorInfo.fromJson(json['data'] as Map<String, dynamic>),
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
