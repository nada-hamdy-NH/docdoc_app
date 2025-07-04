import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowBackContainer extends StatelessWidget {
  const ArrowBackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.popAndPushNamed(context , Routes.home),
      child: Container(
                    padding: EdgeInsets.symmetric( horizontal: 12.0.w ),
                     height: 40.0.h,
                     width: 40.0.w,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0.r),
                       border:Border.all(color: ColorsManager.LighterGray,width: 1.0.w) ,
                       color: Colors.white,
                     ),
                     child: Icon(
                       Icons.arrow_back_ios,
                       color: Colors.black,
                       size: 20.0.w,
                     ),
                   ),
    );
  }
}