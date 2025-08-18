import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 421.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(12),
          Text(
            "About me",
            style: TextStyles.font16darkBlue600Weight,
          ),
          verticalSpace(12),
          Text(
            "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.",
            style: TextStyles.font14GrayRegular
                .copyWith(height: 1.5.h, letterSpacing: 0.4.w),
          ),
          verticalSpace(12),
          Text(
            "Working Time",
            style: TextStyles.font16darkBlue600Weight,
          ),
          verticalSpace(10),
          Text("Monday - Friday, 08.00 AM - 20.00 PM",
              style: TextStyles.font14GrayRegular
                  .copyWith(height: 1.5.h, letterSpacing: 0.4.w)),
          verticalSpace(12),
          Text(
            "STR",
            style: TextStyles.font16darkBlue600Weight,
          ),
          verticalSpace(10),
          Text("4726482464",
              style: TextStyles.font14GrayRegular
                  .copyWith(height: 1.5.h, letterSpacing: 0.4.w)),
          verticalSpace(12),
          Text(
            "Pengalaman Praktik",
            style: TextStyles.font16darkBlue600Weight,
          ),
          verticalSpace(12),
          Text(
            "RSPAD Gatot Soebroto",
            style: TextStyles.font16darkBlue600Weight,
          ),
          verticalSpace(10),
          Text("2017 - sekarang",
              style: TextStyles.font14GrayRegular
                  .copyWith(height: 1.5.h, letterSpacing: 0.4.w)),
        ],
      ),
    );
  }
}
