import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextOfLoginScreen extends StatelessWidget {
  const TextOfLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome Back" , style: TextStyles.font24BlueBold.copyWith(height: 1.6)),
          Text("We're excited to have you back, can't wait to see what you've been up to since you last logged in." ,
            style: TextStyles.font15GrayRegular.copyWith(height: 1.6.h),)
        ],
    
    );
  }
}