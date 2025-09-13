import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/arrow_back_container.dart';
import 'package:docdoc/features/appointement/ui/widgets/search_appbar.dart';
import 'package:flutter/material.dart';

Widget buildHeaderWithTrailling(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const ArrowBackContainer(),
      Text(title, style: TextStyles.font18darkBlueSemiBold),
      SearchTrailingAppBar(),
    ],
  );
}
