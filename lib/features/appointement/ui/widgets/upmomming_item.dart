import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/appointement/data/my_appointment_model.dart';
import 'package:docdoc/features/appointement/ui/widgets/upcoming_tn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentUpComingItem extends StatelessWidget {
  MyAppointmentUpComingItem({
    super.key,
    required this.index,
  });

  final int index;
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
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(16),
      margin: const EdgeInsetsDirectional.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(12),
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
          Row(children: [
            Container(
              width: 74.w,
              height: 74.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage(
                    doctors[index]["image"],
                  ),
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
          ]),
          const Divider(
            color: ColorsManager.LighterGray,
          ),
          Row(
            children: [
              Expanded(
                child: UpcomingBtn(
                  onPressed: () {},
                  text: 'Cancel Appointment',
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: UpcomingBtn(
                  onPressed: () {},
                  text: 'Reschedule',
                  backgroundColor: ColorsManager.mainBlue,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
