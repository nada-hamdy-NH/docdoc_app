import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/features/doctors/data/doctors_model.dart';
import 'package:docdoc/features/login/ui/login_screen.dart';
import 'package:docdoc/features/payment/data/payment_intent_inout_model.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/make_appointment_model.dart';
import 'package:docdoc/features/payment/presentation/logic/cubit/payment_cubit.dart';
import 'package:docdoc/features/payment/presentation/ui/book_appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatefulWidget {
  final PaymentIntentInputModel paymentIntentInputModel;
  int activeStep;
  final VoidCallback onNextStep;
  int selectedPaymentOptionIndex;
  final MakeAppointmentModel? appointmentModel;
  CustomButtonBlocConsumer(
      {super.key,
      required this.activeStep,
      required this.paymentIntentInputModel,
      required this.onNextStep,
      required this.selectedPaymentOptionIndex,
      required this.appointmentModel});

  @override
  State<CustomButtonBlocConsumer> createState() =>
      _CustomButtonBlocConsumerState();
}

bool isLoading = false;

class _CustomButtonBlocConsumerState extends State<CustomButtonBlocConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        state.whenOrNull(
          paymentLoading: () {
            setState(() {
              isLoading = true;
            });
          },
          paymentSuccess: () {
            setState(() => isLoading = false);
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, Routes.home);
          },
          paymentFailed: (Error) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(Error.message.toString()),
            ));
          },
        );
      },
      builder: (context, state) {
        return AppTextButton(
            textStyle: TextStyles.font16WhiteSemiBold,
            buttonText: widget.activeStep == 2 ? "Book Now" : "Continue",
            isLoading: isLoading,
            onPressed: () {
              if (widget.activeStep == 1 &&
                  widget.selectedPaymentOptionIndex == 0) {
                context
                    .read<PaymentCubit>()
                    .makePayment(widget.paymentIntentInputModel);
              } else if (widget.activeStep == 1 &&
                  widget.selectedPaymentOptionIndex == 2) {
                PaypalCheckoutView(
                  sandboxMode: true,
                  clientId: "",
                  secretKey: "",
                  transactions: const [
                    {
                      "amount": {
                        "total": '70',
                        "currency": "USD",
                        "details": {
                          "subtotal": '70',
                          "shipping": '0',
                          "shipping_discount": 0
                        }
                      },
                      "description": "The payment transaction description.",
                      // "payment_options": {
                      //   "allowed_payment_method":
                      //       "INSTANT_FUNDING_SOURCE"
                      // },
                      "item_list": {
                        "items": [
                          {
                            "name": "Apple",
                            "quantity": 4,
                            "price": '5',
                            "currency": "USD"
                          },
                          {
                            "name": "Pineapple",
                            "quantity": 5,
                            "price": '10',
                            "currency": "USD"
                          }
                        ],

                        // shipping address is not required though
                        //   "shipping_address": {
                        //     "recipient_name": "tharwat",
                        //     "line1": "Alexandria",
                        //     "line2": "",
                        //     "city": "Alexandria",
                        //     "country_code": "EG",
                        //     "postal_code": "21505",
                        //     "phone": "+00000000",
                        //     "state": "Alexandria"
                        //  },
                      }
                    }
                  ],
                  note: "Contact us for any questions on your order.",
                  onSuccess: (Map params) async {
                    print("onSuccess: $params");
                  },
                  onError: (error) {
                    print("onError: $error");
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    print('cancelled:');
                  },
                );
              } else {
                if (widget.activeStep == 2) {
                  Navigator.pushReplacementNamed(
                      context, Routes.ConfirmedScreen,
                      arguments: widget.appointmentModel);
                }
                widget.onNextStep();
              }
            });
      },
    );
  }
}
