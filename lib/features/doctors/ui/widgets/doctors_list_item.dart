import 'package:docdoc/features/doctors/data/doctors_model.dart';
import 'package:docdoc/features/doctors/ui/widgets/doctor_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListItem extends StatelessWidget {
  final List<Doctor> doctorsList;

  final int index;
  const DoctorsListItem(
      {super.key, required this.doctorsList, required this.index});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/doctor1.png",
      "assets/images/doctor2.png",
      "assets/images/doctor3.png",
      "assets/images/doctor4.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
      "assets/images/doctor1.png",
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/doctorDetailsScreen",
                arguments: [doctorsList[index], images[index]]);
          },
          child: DoctorContainer(
              images: images, index: index, doctorsList: doctorsList),
        ),
      ),
    );
  }
}
