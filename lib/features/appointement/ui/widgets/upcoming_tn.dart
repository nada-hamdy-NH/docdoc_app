import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class UpcomingBtn extends StatelessWidget {
  const UpcomingBtn({
    super.key,
    this.onPressed,
    required this.text,
    required this.backgroundColor,
    this.textColor,
  });
  final void Function()? onPressed;
  final String text;
  final Color backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: ColorsManager.mainBlue),
        ),
      ),
      child: Text(
        text,
        style: TextStyles.font12BlueBold
            .copyWith(color: textColor ?? ColorsManager.mainBlue),
      ),
    );
  }
}
