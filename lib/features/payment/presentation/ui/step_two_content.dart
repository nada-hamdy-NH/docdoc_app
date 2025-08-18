import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/payment/presentation/ui/payment_option_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepTwoContent extends StatefulWidget {
  const StepTwoContent({super.key,required this.onPaymentOptionSelected });
  final ValueChanged<int> onPaymentOptionSelected;

  @override
  State<StepTwoContent> createState() => _StepTwoContentState();
}

int isSelected = 0;
List<String> paymentOption = ["Credit Card", "Bank Transfer", "Paypal"];

class _StepTwoContentState extends State<StepTwoContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(12),
        Text("Payment Option", style: TextStyles.font16darkBlue600Weight),
        verticalSpace(12),
        Column(
          children: [
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 3,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20.h,
                  );
                },
                itemBuilder: (context, index) {
                  return PaymentOptionRadio(
                      index: index,
                      paymentOption: paymentOption,
                      onTap: () {
                        setState(() {
                          isSelected = index;
                        });
                        widget.onPaymentOptionSelected(index);
                      },
                      isSelected: isSelected);
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
