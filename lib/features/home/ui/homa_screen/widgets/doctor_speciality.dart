import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpeciality extends StatelessWidget {
 final List<SpecializationData?>specializationDataLst;
  const DoctorSpeciality({super.key, required this.specializationDataLst});

  @override
  Widget build(BuildContext context) {
     List<String> items = [
      "assets/images/man_doctor_europe.png",
      "assets/images/brain.png",
      "assets/images/baby.png",
      "assets/images/kidneys.png",
      "assets/images/man_doctor_europe.png",
      "assets/images/brain.png",
      "assets/images/baby.png",
      "assets/images/kidneys.png",
      "assets/images/man_doctor_europe.png",
      "assets/images/brain.png",
      "assets/images/baby.png",
      "assets/images/kidneys.png",
    ];
    return  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w) ,
                    child: SizedBox(
                      width: double.infinity,
                      height: 100.h,
                      child: ListView.builder(
                          itemCount: specializationDataLst.length ,
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
                                      items [index],
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    specializationDataLst[index]?.name ?? "",
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