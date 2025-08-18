import 'package:docdoc/core/helper/lists.dart';
import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/arrow_back_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecilityScreen extends StatelessWidget {
  const SpecilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32.0, horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Row
                      Row(
                        children: [
                          const ArrowBackContainer(),
                          horizontalSpace(60),
                          Text(
                            "Doctor Speciality",
                            style: TextStyles.font18darkBlueSemiBold,
                          )
                        ],
                      ),

                      verticalSpace(20),

                      // Specializations Grid
                      Expanded(
                          child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 50,
                          runSpacing: 30, // space between rows vertically
                          children: List.generate(
                            specializationDataList!.length,
                            (index) {
                              final specialization =
                                  specializationDataList![index];
                              return GestureDetector(
                                onTap: () {
                                  // Handle tap — navigate to doctors screen later
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 40.r,
                                      backgroundColor: ColorsManager
                                          .speciality_background
                                          .withOpacity(0.05),
                                      child: specialityImagesList[index],
                                    ),
                                    verticalSpace(8),
                                    SizedBox(
                                      width:
                                          80, // for consistent text alignment
                                      child: Text(
                                        specialization.name ?? "",
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyles.font13DarkBlueRegular,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ))
                    ]))));
  }
}
