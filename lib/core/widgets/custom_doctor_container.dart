import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/doctors/ui/doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDoctorContainer extends StatelessWidget {
  const CustomDoctorContainer({
    super.key,
    required this.widget,
  });

  final DoctorDetailsScreen widget;

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
              widget.image,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.doctor.name!,
            style: TextStyles.font16darkBlueBold,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text("${widget.doctor.specialization!.name} | ${widget.doctor.phone}",
              style: TextStyles.font12GrayMedium),
          SizedBox(
            height: 8.h,
          ),
          Text(
            widget.doctor.email!,
            style: TextStyles.font12GrayMedium,
          )
        ]),
      ),
      Spacer(),
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
