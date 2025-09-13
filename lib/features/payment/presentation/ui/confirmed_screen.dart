import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/core/widgets/build_header.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/make_appointment_model.dart';
import 'package:docdoc/features/payment/presentation/ui/booking_info_time_anddate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmedScreen extends StatelessWidget {
  final MakeAppointmentModel appientmentModel;

  ConfirmedScreen({super.key, required this.appientmentModel});

  final List<Map<String, String>> bookingInfo = [
    {
      "icon": "assets/svgs/calendar.svg",
      "title": "Date & Time",
    },
    {"icon": "assets/svgs/clipboard-text.svg", "title": "Appointment Type"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 62.h, bottom: 20.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: buildHeader("Details"),
          ),
          verticalSpace(60),
          Center(
              child: SvgPicture.asset(
            "assets/svgs/confirmed.svg",
            width: 65.w,
            height: 65.h,
          )),
          verticalSpace(30),
          Center(
              child: Text("Booking Confirmed",
                  style: TextStyles.font20darkBluemedium)),
          verticalSpace(50),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Booking Information",
                style: TextStyles.font16darkBlue600Weight,
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: BookingInfoTimeAndDate(
                  bookingInfo: bookingInfo,
                  selectedDate: appientmentModel.selectedDate,
                  selectedTime: appientmentModel.selectedTime,
                  appointmentType: appientmentModel.appointmentType)),
          Padding(
            padding: EdgeInsets.only(bottom: 12.0.h, left: 20.0.h, top: 8.h),
            child: Text(
              "Doctor Information",
              style: TextStyles.font16darkBlue600Weight,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(
                          appientmentModel.image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " ${appientmentModel.doctorInfo.data!.name}",
                            style: TextStyles.font16darkBlueBold,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                              "${appientmentModel.doctorInfo.data!.specialization!.name!} | ${appientmentModel.doctorInfo.data!.phone}",
                              style: TextStyles.font12GrayMedium),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "${appientmentModel.doctorInfo.data!.email}",
                            style: TextStyles.font12GrayMedium,
                          )
                        ]),
                  )
                ]),
              )),
          verticalSpace(45),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: AppTextButton(
              textStyle: TextStyles.font16WhiteSemiBold,
              buttonText: "Done",
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.home);
              },
            ),
          )
        ]),
      ),
    );
  }
}
