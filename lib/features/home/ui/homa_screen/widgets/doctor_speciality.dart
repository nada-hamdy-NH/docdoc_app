import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
     List<List<String>> items = [
      ["assets/images/man_doctor_europe.png", "General"],
      ["assets/images/brain.png", "Neurologic"],
      ["assets/images/baby.png", "Pediatric"],
      ["assets/images/kidneys.png", "Radiology"],
    ];
    return  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w) ,
                    child: SizedBox(
                      width: double.infinity,
                      height: 100.h,
                      child: ListView.builder(
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Column(
                                  children: [
                                  CircleAvatar(
                                    radius: 28.r,
                                    backgroundColor: ColorsManager.someLiterGray,
                                    child: Image.asset(
                                      items[index][0],
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    items[index][1],
                                    style: TextStyles.font12Black400Weight,
                                  )
                                ]),
                                SizedBox(
                                  width: 31.w,
                                ),
                              ],
                            );
                          }),
                    ),
                  ) ;
  }
}