import 'package:dio/dio.dart';
import 'package:docdoc/features/payment/data/payment_constant.dart';
import 'package:docdoc/features/payment/data/payment_intent_inout_model.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/payment_intent_model.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_api_service_temp.g.dart';

@RestApi(baseUrl: "https://api.stripe.com/v1/")
abstract class PaymentApiService {
  factory PaymentApiService(Dio dio, {String? baseUrl}) = _PaymentApiService;

  @POST(PaymentConstant.createPaymentIntent)
  Future<PaymentIntentResponseModel> createPaymentIntent(
    @Body() PaymentIntentInputModel paymentIntentInoutModel,
  );
}
