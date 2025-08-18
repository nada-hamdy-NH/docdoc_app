import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/doctors/data/doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorContainer extends StatelessWidget {
  const DoctorContainer({
    super.key,
    required this.images,
    required this.index,
    required this.doctorsList,
  });

  final List<String> images;
  final int index;
  final List<Doctor> doctorsList;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 110.w,
        height: 110.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            image: AssetImage(images[index]),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            doctorsList[index].name!,
            style: TextStyles.font16darkBlueBold,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
              "${doctorsList[index].specialization!.name} | ${doctorsList[index].phone}",
              style: TextStyles.font12GrayMedium),
          SizedBox(
            height: 8.h,
          ),
          Text(
            doctorsList[index].email!,
            style: TextStyles.font12GrayMedium,
          )
        ]),
      )
    ]);
  }
}
