import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/ui/homa_screen/widgets/doctor_speciality.dart';
import 'package:docdoc/features/home/ui/homa_screen/widgets/doctors.dart';
import 'package:docdoc/features/home/ui/homa_screen/widgets/find_near_button.dart';
import 'package:docdoc/features/home/ui/homa_screen/widgets/name_notificationIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return  SafeArea(
            child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 25.h),
                child: Column(children: [
                const NameNotificationIcon(),
                  SizedBox(
                    width: double.infinity,
                    height: 197.h,
                    child: Column(children: [
                      Expanded(
                        flex: 2,
                        child: Stack(children: [
                          SizedBox(
                            height: 197.h,
                            width: double.infinity,
                          ),
                        const FindNearButton(),
                          Positioned(
                            top: 0,
                            right: 16,
                            child: Image(
                              image: const AssetImage(
                                "assets/images/Image.png",
                              ),
                              width: 136.w,
                              height: 197.h,
                            ),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Row(
                      children: [
                        Text(
                          "Doctor Speciality",
                          style: TextStyles.font18darkBlueSemiBold,
                        ),
                      const  Spacer(),
                        Text(
                          "See All",
                          style: TextStyles.font12BlueRegular,
                        )
                      ],
                    ),
                  ),
                 
                const DoctorSpeciality(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Row(
                      children: [
                        Text(
                          "Recommendation Doctor",
                          style: TextStyles.font18darkBlueSemiBold,
                        ),
                        const Spacer(),
                        Text(
                          "See All",
                          style: TextStyles.font12BlueRegular,
                        )
                      ],
                    ),
                  ),
                  const Doctors(),
               ],)));
  }
}