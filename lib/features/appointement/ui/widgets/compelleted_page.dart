import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/appointement/ui/widgets/status_and_data.dart';
import 'package:docdoc/features/doctors/ui/widgets/doctor_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletedPage extends StatelessWidget {
  CompletedPage({super.key});

  List<Map<String, dynamic>> doctors = [
    {
      "name": "Jane Cooper",
      "image": "assets/images/doctor1.png",
      "speciality": "Dentist",
      "phone": "(123) 456-7890",
      "email": "p1oCt@example.com"
    },
    {
      "name": "Jane Cooper",
      "image": "assets/images/doctor2.png",
      "speciality": "Dentist",
      "phone": "(123) 456-7890",
      "email": "p1oCt@example.com"
    },
    {
      "name": "Jane Cooper",
      "image": "assets/images/doctor3.png",
      "speciality": "Dentist",
      "phone": "(123) 456-7890",
      "email": "p1oCt@example.com"
    },
    {
      "name": "Jane Cooper",
      "image": "assets/images/doctor4.png",
      "speciality": "Dentist",
      "phone": "(123) 456-7890",
      "email": "p1oCt@example.com"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          3,
          (index) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsetsDirectional.only(
                start: 16,
                end: 16,
                bottom: 21,
              ),
              margin: const EdgeInsetsDirectional.only(top: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 30,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  AppointmentStatusAndDateWidget(
                    index: index,
                    color: const Color(0xff22C55E),
                    status: "Appointment done",
                  ),
                  const Divider(
                    color: ColorsManager.LighterGray,
                  ),
                  Row(children: [
                    Container(
                      width: 110.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: AssetImage(doctors[index]["image"]),
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
                              doctors[index]["name"],
                              style: TextStyles.font16darkBlueBold,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                                "${doctors[index]["speciality"]} | ${doctors[index]["phone"]}",
                                style: TextStyles.font12GrayMedium),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              doctors[index]["email"],
                              style: TextStyles.font12GrayMedium,
                            )
                          ]),
                    )
                  ])
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
