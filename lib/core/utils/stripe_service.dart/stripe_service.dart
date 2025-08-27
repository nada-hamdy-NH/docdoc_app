import 'package:docdoc/features/payment/data/payment_api_service_temp.dart';
import 'package:docdoc/features/payment/data/payment_intent_inout_model.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final PaymentApiService paymentApiService;
  StripeService(this.paymentApiService);

  Future<PaymentIntentResponseModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInoutModel) async {
    try {
      var response =
          await paymentApiService.createPaymentIntent(paymentIntentInoutModel);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      customFlow: false,
      merchantDisplayName: 'Flutter Stripe Store Demo',
      paymentIntentClientSecret: paymentIntentClientSecret,
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(PaymentIntentInputModel paymentIntentInoutModel) async {
    var response = await createPaymentIntent(paymentIntentInoutModel);
    await initPaymentSheet(paymentIntentClientSecret: response.clientSecret!);
    await displayPaymentSheet();
  }
}
