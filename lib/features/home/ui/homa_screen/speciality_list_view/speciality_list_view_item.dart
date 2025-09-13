import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpecialityListViewItem extends StatelessWidget {
  final List<SpecializationData?> specializationDataLst;
  final int itemIndex;
  final selectedIndex;
  SpecialityListViewItem(
      {super.key,
      required this.specializationDataLst,
      required this.itemIndex,
      required this.selectedIndex});
  List<Widget> specialityImagesList = [
    SvgPicture.asset(
      "assets/svgs/cardilogist.svg",
      width: 38.w,
      height: 38.h,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Dermatology.png",
      width: 38.w,
      height: 38.h,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/brain.png",
      width: 38.w,
      height: 38.h,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Orthopedics.png",
      width: 38.w,
      height: 38.h,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/baby.png",
      width: 38.w,
      height: 38.h,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Gynecology.png",
      width: 38.w,
      height: 38.h,
      fit: BoxFit.cover,
    ),
    SvgPicture.asset(
      "assets/svgs/optometary.svg",
      width: 38.w,
      height: 38.h,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Urologist.png",
      width: 38.w,
      height: 38.h,
      fit: BoxFit.cover,
    ),
    SvgPicture.asset(
      "assets/svgs/histologist.svg",
      width: 38.w,
      height: 38.h,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Psychiatry.png",
      width: 38.w,
      height: 38.h,
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      selectedIndex == itemIndex
          ? Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.5.w, color: ColorsManager.darkBlue),
                  shape: BoxShape.circle),
              child: CircleAvatar(
                radius: 28.r,
                backgroundColor: ColorsManager.someLiterGray,
                child: specialityImagesList[itemIndex],
              ),
            )
          : CircleAvatar(
              radius: 28.r,
              backgroundColor: ColorsManager.someLiterGray,
              child: specialityImagesList[itemIndex],
            ),
      SizedBox(
        height: 10.h,
      ),
      Text(
        specializationDataLst[itemIndex]?.name ?? "",
        style: itemIndex == selectedIndex
            ? TextStyles.font14DarkBlueBold
            : TextStyles.font12Black400Weight,
      )
    ]);
  }
}
