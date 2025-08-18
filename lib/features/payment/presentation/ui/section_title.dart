import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

Widget sectionTitle(String title, {String? action}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Row(
      children: [
        Text(title, style: TextStyles.font16darkBlue600Weight),
        const Spacer(),
        if (action != null) Text(action, style: TextStyles.font12Bluemeduim),
      ],
    ),
  );
}
