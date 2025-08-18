import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/arrow_back_container.dart';
import 'package:flutter/material.dart';

Widget buildHeader() {
  return Row(
    children: [
      const ArrowBackContainer(),
      horizontalSpace(60),
      Text("Book Appointment", style: TextStyles.font18darkBlueSemiBold),
    ],
  );
}
