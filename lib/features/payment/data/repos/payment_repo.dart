import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/payment/data/payment_intent_inout_model.dart';

abstract class PaymentRepo {
  Future<ApiResult> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
