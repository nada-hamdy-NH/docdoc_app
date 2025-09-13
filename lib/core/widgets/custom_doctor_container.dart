import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/doctors/data/doctor/doctor.dart';
import 'package:docdoc/features/doctors/data/doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDoctorContainer extends StatelessWidget {
  final DoctorModel doctor;
  final String image;
  const CustomDoctorContainer({
    super.key,
    required this.doctor,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 74.w,
        height: 74.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            doctor.data?.name ?? "",
            style: TextStyles.font16darkBlueBold,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
              "${doctor.data?.specialization?.name ?? ""} | ${doctor.data?.phone ?? ""}",
              style: TextStyles.font12GrayMedium),
          SizedBox(
            height: 8.h,
          ),
          Text(
            doctor.data?.email ?? "",
            style: TextStyles.font12GrayMedium,
          )
        ]),
      ),
      const Spacer(),
      GestureDetector(
          onTap: () {},
          child: Image.asset(
            "assets/images/message.png",
            width: 24.w,
            height: 24.h,
            fit: BoxFit.cover,
          ))
    ]);
  }
}
