import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputStyle;
  final String hintText;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final Color? fillColor;
  final TextEditingController? controller;
  final Function (String) validator;

  const AppTextFormField(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.hintStyle,
      this.inputStyle,
      required this.hintText,
      this.suffixIcon,
      this.isObscureText,
      this.fillColor,
      this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(
          vertical: 18.h,
          horizontal: 20.w,
        ),
        focusedBorder : focusedBorder ?? OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.mainBlue, width: 1.3.w),
            borderRadius: BorderRadius.all(Radius.circular(16.r))),
        enabledBorder: enabledBorder ?? OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.LighterGray, width: 1.3.w),
            borderRadius: BorderRadius.all(Radius.circular(16.r))),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red , 
            width: 1.3
          ),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red , 
            width: 1.3),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        hintStyle: hintStyle ?? TextStyles.font14LiteGrayMediam,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: fillColor ?? ColorsManager.MoreLiteGray,
        filled: true,
      ),
      obscureText: isObscureText  ?? false,
      style: TextStyles.font14DarkBlueMedium,
      validator: (value) {
        return validator(value!); 
      },
    );
  }
}
