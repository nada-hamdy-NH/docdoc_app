class LogoutModel {
  String? message;
  List<dynamic>? data;
  bool? status;
  int? code;

  LogoutModel({this.message, this.data, this.status, this.code});

  factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
        message: json['message'] as String?,
        data: json['data'] as List<dynamic>?,
        status: json['status'] as bool?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data,
        'status': status,
        'code': code,
      };
}
