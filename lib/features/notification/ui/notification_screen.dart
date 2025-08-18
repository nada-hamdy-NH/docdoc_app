import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/arrow_back_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      NotificationItem(
        icon: "assets/svgs/calendar-tick.svg",
        color: ColorsManager.liteGreen,
        isRead: true,
      ),
      NotificationItem(
        icon: "assets/svgs/calendar-tick2.svg",
        color: ColorsManager.liteBlue,
        isRead: false,
      ),
      NotificationItem(
        icon: "assets/svgs/video.svg",
        color: ColorsManager.liteGreen,
        isRead: true,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Text(
          "Yasterday",
          style: TextStyles.font12LiteGray500Weight,
        ),
      ),
      NotificationItem(
        icon: "assets/svgs/calendar-remove.svg",
        color: ColorsManager.literRed,
        isRead: true,
      ),
      NotificationItem(
        icon: "assets/svgs/wallet-2.svg",
        color: ColorsManager.liteBlue,
        isRead: false,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 35.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ArrowBackContainer(),
                      Text(
                        "Notification",
                        style: TextStyles.font18Black600Weight,
                      ),
                      Container(
                        height: 27.0.h,
                        width: 51.0.w,
                        decoration: BoxDecoration(
                          color: ColorsManager.mainBlue,
                          borderRadius: BorderRadius.circular(24.0.r),
                        ),
                        child: Center(
                            child: Text(
                          "2 New",
                          style: TextStyles.font8WhiteMedium,
                        )),
                      )
                    ]),
                SizedBox(
                  height: 20.0.h,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today",
                        style: TextStyles.font12MoreLiteGray500Weight,
                      ),
                      Text(
                        "Mark all as read",
                        style: TextStyles.font12BlueRegular,
                      ),
                    ])
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 642.h,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => items[index],
            ),
          ),
        ]),
      ),
    );
  }

  Widget NotificationItem(
      {required String icon, required Color color, required bool isRead}) {
    return Container(
        height: 121.h,
        color: isRead ? Colors.white : ColorsManager.liteBackground,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40.0.w,
                  height: 40.0.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: color //ColorsManager.liteGreen,
                      ),
                  child: Center(
                      child: SvgPicture.asset(
                          //"assets/svgs/calendar-tick.svg",
                          icon,
                          width: 24.w,
                          height: 24.h)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Appointment Success ",
                      style: TextStyles.font14DarkBlueSiemiBold,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Congratulations - your appointment is \nconfirmed! We're looking forward to meeting \nwith you and helping you achieve your goals.",
                      style: TextStyles.font12GrayRegular,
                    ),
                  ],
                ),
                Column(children: [
                  Text(
                    "1h",
                    style: TextStyles.font10LiteGrayRegular,
                  ),
                  verticalSpace(5),
                  CircleAvatar(
                    radius: 2.5.r,
                    backgroundColor:
                        isRead ? Colors.white : ColorsManager.liteRed,
                  ),
                ])
              ],
            )));
  }
}
