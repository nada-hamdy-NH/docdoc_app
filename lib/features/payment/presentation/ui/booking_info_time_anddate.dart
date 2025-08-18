import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class BookingInfoTimeAndDate extends StatelessWidget {
  final DateTime selectedDate;
  final String selectedTime;
  final String appointmentType;
  const BookingInfoTimeAndDate( {
    required this.selectedDate,
    required this.selectedTime,
    required this.bookingInfo,
    required this.appointmentType,
    super.key,
   
  });

  final List<Map<String, String>> bookingInfo;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
      ),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bookingInfo.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: ColorsManager.liteBlue,
                            borderRadius: BorderRadius.circular(16.r)),
                        child: Center(
                            child: SvgPicture.asset(
                          bookingInfo[index]["icon"]!,
                        ))),
                    horizontalSpace(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookingInfo[index]["title"]!,
                          style: TextStyles.font16darkBlue600Weight,
                        ),
                        verticalSpace(5),
                        index == 0 ?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ Text(
                           DateFormat('EEEE, dd MMMM yyyy').format(selectedDate)  ,
                          style: TextStyles.font12GrayRegular,
                        ),
                        verticalSpace(5),
                        Text(
                          selectedTime + " PM",
                          style: TextStyles.font12GrayRegular,
                        )],): 
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ Text(
                            appointmentType ,
                          style: TextStyles.font12GrayRegular,
                        ),
                         verticalSpace(10),
                        ],)
                       
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 7.0.h, top: 7.0.h),
                  child: const Divider(
                    color: ColorsManager.LighterGray,
                    height: 1,
                  ),
                )
              ],
            );
          }),
    );
  }
}
