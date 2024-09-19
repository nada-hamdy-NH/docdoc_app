import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24Black700Weight = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.bold, 
      color: Colors.black);

  static TextStyle font32BlueBold = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.mainBlue);


  static TextStyle font13GrayRegular = TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeightHelper.regular,
            color: ColorsManager.gray);


  static TextStyle font16WhiteSemiBold = TextStyle(
      fontSize: 16.sp,
       fontWeight: FontWeightHelper.semiBold,
        color: Colors.white);

  static TextStyle font24BlueBold = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainBlue,
    letterSpacing: -0.2,
  );
  
  static TextStyle font15GrayRegular = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.gray,
    letterSpacing: 0.2,
  );

  static TextStyle font14LiteGrayMediam = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.lightGray,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.darkBlue,
  );
  static TextStyle font13DarkBlueMedium = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.darkBlue,
  );
  static TextStyle font15DarkBlueMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.darkBlue,
  );

  static TextStyle font13DarkBlueRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.darkBlue,
  );

  static TextStyle font12GrayRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: const Color(0xFF9E9E9E),
  );

  static TextStyle font12BlueRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mainBlue,
  );

  static TextStyle font13BlueRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mainBlue,
  );

  static TextStyle font12BlueBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainBlue,
  );

  static TextStyle font14BlueSemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.mainBlue,
  );
}
