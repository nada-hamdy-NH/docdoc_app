import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/arrow_back_container.dart';
import 'package:flutter/material.dart';

Widget buildHeader(String title) {
  return Row(
    children: [
      const ArrowBackContainer(),
      Expanded(
          child: Center(
              child: Text(title, style: TextStyles.font18darkBlueSemiBold))),
      horizontalSpace(40)
    ],
  );
}
