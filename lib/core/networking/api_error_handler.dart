import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_error_model.dart';

class ApiErrorHandler {
  late ApiErrorModel apiErrorModel;

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection To Server Failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request To Server Was Cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection Timeout To Server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message: "Connection To Server Failed Dio to Time Connection ");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "receive Timeout in Connection To Server");
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: "send Timeout in Connection To Server");
        case DioExceptionType.badResponse:
          return _handleError(error.response!.data);
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else {
      return ApiErrorModel(message: "Something went wrong");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  if (data is Map<String, dynamic>) {
    return ApiErrorModel(
      message: data["message"]?.toString() ?? "Something went wrong",
      errors: data["data"], // سواء كانت List أو Map هيقبلها كـ dynamic
    );
  } else {
    return ApiErrorModel(
      message: "Unexpected error format",
      errors: data,
    );
  }
}