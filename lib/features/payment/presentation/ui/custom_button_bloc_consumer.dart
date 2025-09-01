import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/features/payment/data/payment_intent_inout_model.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/amount_model/amount_model.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/amount_model/details.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/items_model/item.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/items_model/items_model.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/make_appointment_model.dart';
import 'package:docdoc/features/payment/presentation/logic/cubit/payment_cubit.dart';
import 'package:docdoc/features/payment/presentation/ui/execute_payoal_method.dart';
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
            setState(() => isLoading = false
           
            );
            Navigator.pop(context);
            Navigator.pushReplacementNamed(
                      context, Routes.ConfirmedScreen,
                      arguments: widget.appointmentModel);
           
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
              if (widget.activeStep == 2 &&
                  widget.selectedPaymentOptionIndex == 0) {
                context
                    .read<PaymentCubit>() .makePayment(widget.paymentIntentInputModel);

              } else if (widget.activeStep == 2 &&
                  widget.selectedPaymentOptionIndex == 2) {
                    var transactions = getTransaction();
                     executePaypalMethod(context, transactions , widget.appointmentModel!);
                
                   
              } 
                widget.onNextStep();
              
            });
      },
    );
  }

  
 ({AmountModel amount, ItemsModel items}) getTransaction(){
    var amount = AmountModel(total: "70" , currency: "usd" , details: Details(
                      subtotal: "70" , shipping: "0" , shippingDiscount: 0
                     ) );
                     List<Item> orders = [Item(name: "Apple" , quantity: 4 , price: "5" , currency: "usd" ) , 
                     Item( name: "Pineapple",
                            quantity: 5,
                            price: '10',
                            currency: "USD")
                     ];
                     var items = ItemsModel(items:orders );
                     return(amount : amount ,items : items) ; 
  }
}
