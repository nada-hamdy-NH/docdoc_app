import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final TextStyle textStyle;
  final String buttonText;
  final Color? backgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final VoidCallback onPressed;
  const AppTextButton({super.key, required this.textStyle, this.buttonWidth, this.buttonHeight, this.borderRadius, this.horizontalPadding, this.verticalPadding, this.backgroundColor, required this.buttonText,
   required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
        ),
          ),
        backgroundColor:  WidgetStatePropertyAll<Color>(
            backgroundColor ?? ColorsManager.mainBlue),
      padding: WidgetStatePropertyAll( EdgeInsets.symmetric(
        horizontal:horizontalPadding?.w ?? 12.w,
        vertical: verticalPadding?.h ?? 14.h
      )),
      fixedSize: WidgetStatePropertyAll(Size(buttonWidth?.w ?? double.maxFinite ,buttonHeight ?? 52.h)),
      ),
      onPressed:onPressed,
      child: Text(
        buttonText,
        style: textStyle,));
  }
}
