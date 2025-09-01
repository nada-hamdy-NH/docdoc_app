
import 'dart:developer';

import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/amount_model/amount_model.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/items_model/items_model.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/make_appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

 executePaypalMethod(BuildContext context, ({AmountModel amount, ItemsModel items ,  }) transactions ,MakeAppointmentModel appointmentModel ) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                    PaypalCheckoutView(
                      sandboxMode: true,
                      clientId: dotenv.env['PAYPAL_CLIENT_ID'],
                      secretKey: dotenv.env['PAYPAL_SECRET_KEY'],
                      transactions: [
    {
      "amount": transactions.amount.toJson(),
      "description": "The payment transaction description.",
      "item_list":transactions.items.toJson()
    }
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
    log("onSuccess: $params");
     Navigator.pop(context);
      Navigator.pushReplacementNamed(
                      context, Routes.ConfirmedScreen,
                      arguments: appointmentModel);



                      },
                      onError: (error) {
    log("onError: $error");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error.toString()),
            ));
                      },
                      onCancel: () {
    log('cancelled:');
     Navigator.pop(context);
    
                      },
                    )));
  }