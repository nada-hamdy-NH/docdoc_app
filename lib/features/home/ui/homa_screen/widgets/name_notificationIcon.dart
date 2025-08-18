import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NameNotificationIcon extends StatelessWidget {
  const NameNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Omar!",
              style: TextStyles.font18Black700Weight,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "How Are you Today?",
              style: TextStyles.font11MoreLiterGray400Weight,
            ),
          ],
        ),
        SizedBox(
          width: 195.w,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.notificationScreen);
          },
          child: CircleAvatar(
            radius: 24.r,
            backgroundColor: ColorsManager.SomeLiteGray,
            child: SvgPicture.asset(
              "assets/svgs/Button.svg",
              width: 23.w,
              height: 23.h,
            ),
          ),
        )
      ],
    );
  }
}
