import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:docdoc/features/home/ui/homa_screen/doctors_list/doctors_bloc_builder.dart';
import 'package:docdoc/features/home/ui/homa_screen/widgets/find_near_button.dart';
import 'package:docdoc/features/home/ui/homa_screen/widgets/name_notificationIcon.dart';
import 'package:docdoc/features/home/ui/homa_screen/speciality_list_view/specializations_bloc_builder.dart';
import 'package:docdoc/features/home/ui/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  List<SpecializationData?>? specializationDataList;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 25.h),
            child: Column(
              children: [
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
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.specialityScreen,
                            arguments:
                                context.read<HomeCubit>().state.specializations,
                          );
                        },
                        child: Text(
                          "See All",
                          style: TextStyles.font12BlueRegular,
                        ),
                      )
                    ],
                  ),
                ),
                SpecializationsBlocBuilder(),
                SizedBox(
                  height: 15.h,
                ),
                DoctorsBlocBuilder(specializationDataList)
              ],
            )));
  }
}
