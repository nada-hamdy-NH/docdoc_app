import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedContainers extends StatelessWidget {
  PageController pageController;
  RoundedContainers({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 80.h,
          width: 80.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.r), color: Colors.white),
          child: Center(
            child: InkWell(
              onTap: () => pageController.jumpToPage(2),
              child: Container(
                height: 72.h,
                width: 72.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.r),
                    color: ColorsManager.mainBlue),
                child: Image.asset(
                  "assets/images/search-normal-1.png",
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
