import 'dart:developer';

import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/core/widgets/arrow_back_container.dart';
import 'package:docdoc/core/widgets/custom_doctor_container.dart';
import 'package:docdoc/features/doctors/data/doctors_model.dart';
import 'package:docdoc/features/doctors/logic/doctors_cubit.dart';
import 'package:docdoc/features/doctors/logic/doctors_state.dart';
import 'package:docdoc/features/doctors/ui/widgets/about_widget.dart';
import 'package:docdoc/features/doctors/ui/widgets/location_widget.dart';
import 'package:docdoc/features/doctors/ui/widgets/reviews_widget.dart';
import 'package:docdoc/features/payment/presentation/logic/cubit/payment_cubit.dart';
import 'package:docdoc/features/payment/presentation/ui/book_appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final String image;

  const DoctorDetailsScreen({super.key, required this.image});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  int selectedTabIndex = 0;
  final List<String> tabs = ["About", "Location", "Reviews"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.symmetric(vertical: 32.0.h, horizontal: 20.w),
      child: BlocBuilder<DoctorsCubit, DoctorsState>(
        builder: (context, state) {
          return state.maybeWhen(
              doctorSuccess: (doctorData) {
                print("Doctor Name from API: ${doctorData.data?.name}");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ArrowBackContainer(),
                        Text(
                          "Doctor Speciality",
                          style: TextStyles.font18darkBlueSemiBold,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40.0.h,
                            width: 40.0.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0.r),
                              border: Border.all(
                                  color: ColorsManager.LighterGray,
                                  width: 1.0.w),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.black,
                              size: 20.0.w,
                            ),
                          ),
                        )
                      ],
                    ),
                    verticalSpace(32),

                    CustomDoctorContainer(
                      doctor: doctorData,
                      image: widget.image,
                    ),
                    verticalSpace(32),
                    // Tabs
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(tabs.length, (index) {
                        bool selected = index == selectedTabIndex;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTabIndex = index;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                tabs[index],
                                style: TextStyles.font14BlueBold.copyWith(
                                    color: selected
                                        ? ColorsManager.mainBlue
                                        : ColorsManager.lightGray),
                              ),
                              verticalSpace(10),
                              SizedBox(
                                width: 111.5.w,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    // الخط الرمادي تحت كل التبويبات
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: ColorsManager.MoreLiterGray
                                          .withOpacity(0.3), // الرمادي
                                    ),
                                    // الخط الأزرق يظهر فقط عند التحديد
                                    if (selected)
                                      Container(
                                        width: 115.w,
                                        height: 2,
                                        color: ColorsManager.mainBlue,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),

                    verticalSpace(18),

                    // Dynamic Content
                    Expanded(
                      child: SingleChildScrollView(
                        child: IndexedStack(
                          index: selectedTabIndex,
                          children: [
                            const AboutWidget(),
                            LocationTab(
                              doctor: doctorData,
                            ),
                            const ReviewsTab(),
                          ],
                        ),
                      ),
                    ),

                    AppTextButton(
                      buttonText: "Make An Appointment",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => getIt<PaymentCubit>(),
                                child: BookAppointment(
                                    image: widget.image,
                                    doctorInfo: doctorData),
                              ),
                            ));
                      },
                    ),
                  ],
                );
              },
              orElse: () => const Center(child: CircularProgressIndicator()));
        },
      ),
    )));
  }
}
