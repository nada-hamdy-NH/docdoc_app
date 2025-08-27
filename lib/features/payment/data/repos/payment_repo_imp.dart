import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/core/utils/stripe_service.dart/stripe_service.dart';
import 'package:docdoc/features/payment/data/payment_intent_inout_model.dart';
import 'package:docdoc/features/payment/data/repos/payment_repo.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentRepoImp extends PaymentRepo {
  StripeService stripeService;

  PaymentRepoImp(this.stripeService);

  @override
  Future<ApiResult> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(paymentIntentInputModel);
      return const ApiResult.success(null);
    } on StripeException catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
