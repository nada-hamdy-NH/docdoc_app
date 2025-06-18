import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListViewItem extends StatelessWidget {
  final List<SpecializationData?> specializationDataLst ;
  final int itemIndex;
  final selectedIndex ;
  const SpecialityListViewItem({super.key, required this.specializationDataLst , required this.itemIndex , required this.selectedIndex}) ;

  @override
  Widget build(BuildContext context) {
    return  Column(
                                    children: [
                                    selectedIndex == itemIndex ? 
                                      
                                    Container(
                                      decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.5.w,
                                        color: ColorsManager.darkBlue) ,
                                        shape: BoxShape.circle
                                    ),
                                      child: CircleAvatar(
                                        radius: 28.r,
                                        backgroundColor: ColorsManager.someLiterGray,
                                        child: Image.asset(
                                         "assets/images/man_doctor_europe.png",
                                          width: 26.w,
                                          height: 26.h,
                                        ),
                                      ),
                                    )
                                    :
                                    CircleAvatar(
                                      radius: 28.r,
                                      backgroundColor: ColorsManager.someLiterGray,
                                      child: Image.asset(
                                       "assets/images/man_doctor_europe.png",
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      specializationDataLst[itemIndex]?.name ?? "",
                                      style:itemIndex == selectedIndex ?   TextStyles.font14DarkBlueBold : TextStyles.font12Black400Weight,
                                    )
                                  ]);
  }
}