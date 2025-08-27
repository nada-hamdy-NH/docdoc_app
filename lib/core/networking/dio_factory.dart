import 'package:dio/dio.dart';
import 'package:docdoc/core/helper/constants.dart';
import 'package:docdoc/core/helper/shared_preference.dart';
import 'package:docdoc/core/utils/stripe_service.dart/api_keys.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? _appDio;
  static Dio? _stripeDio;

  /// Dio للتطبيق الأساسي
  static Dio getAppDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (_appDio == null) {
      _appDio = Dio();
      _appDio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      _addAppHeaders();
      _addLogger(_appDio!);
    }
    return _appDio!;
  }

  /// Dio خاص بـ Stripe
  static Dio getStripeDio() {
    if (_stripeDio == null) {
      _stripeDio = Dio(
        BaseOptions(
          baseUrl: "https://api.stripe.com/v1/",
          headers: {
            "Authorization": "Bearer ${ApiKeys.secretKey}",
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
      );
      _addLogger(_stripeDio!);
    }
    return _stripeDio!;
  }

  /// تحديث التوكين بعد تسجيل الدخول
  static void setTokenIntoHeaderAfterLogin(String token) {
    _appDio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }

  static void _addAppHeaders() async {
    _appDio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getSecuredStorage(ConstantsPrfKeys.userToken)}',
    };
  }

  static void _addLogger(Dio dio) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
