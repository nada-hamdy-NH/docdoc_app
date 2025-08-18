import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentOptionRadio extends StatelessWidget {
  final int index;
  final int isSelected;

  final List<String> paymentOption;
  final VoidCallback onTap;
  const PaymentOptionRadio(
      {super.key,
      required this.index,
      required this.paymentOption,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(
            isSelected == index
                ? Icons.radio_button_checked
                : Icons.radio_button_off,
            color: ColorsManager.mainBlue,
            size: 22.w,
          ),
        ),
        horizontalSpace(5),
        Text(paymentOption[index],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
