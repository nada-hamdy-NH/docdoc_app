import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

Widget header({required int activeStep}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Date & Time",
        style: activeStep == 0
            ? TextStyles.font10Black400Weight
                .copyWith(color: ColorsManager.mainBlue)
            : activeStep == 1
                ? TextStyles.font10Black400Weight
                    .copyWith(color: ColorsManager.green)
                : TextStyles.font10Black400Weight,
      ),
      Text(
        "Payment",
        style: activeStep == 1
            ? TextStyles.font10Black400Weight
                .copyWith(color: ColorsManager.mainBlue)
            : activeStep == 2
                ? TextStyles.font10Black400Weight
                    .copyWith(color: ColorsManager.green)
                : TextStyles.font10Black400Weight,
      ),
      Text(
        "Summary",
        style: activeStep == 2
            ? TextStyles.font10Black400Weight
                .copyWith(color: ColorsManager.mainBlue)
            : TextStyles.font10Black400Weight,
      ),
    ],
  );
}
