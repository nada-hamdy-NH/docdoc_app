import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/features/doctors/logic/doctors_cubit.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterDialog extends StatefulWidget {
  final List<SpecializationData> specialityName;
  const FilterDialog({super.key, required this.specialityName});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

int selectedIndex = 0;

class _FilterDialogState extends State<FilterDialog> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () => Navigator.pop(context),
        builder: (context) => Container(
              height: 395.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpace(8),
                      Container(
                        height: 3.82.h,
                        width: 58.w,
                        decoration: BoxDecoration(
                          color: ColorsManager.LighterGray,
                          borderRadius: BorderRadius.circular(8.59.r),
                        ),
                      ),
                      verticalSpace(40),
                      Text(
                        "Sort By",
                        style: TextStyles.font18darkBlueSemiBold,
                      ),
                      verticalSpace(16),
                      Divider(
                        color: ColorsManager.LighterGray,
                        thickness: 1.w,
                      ),
                      verticalSpace(30),
                      Padding(
                        padding: EdgeInsets.only(right: 270.0.w),
                        child: Text(
                          "Speciality",
                          style: TextStyles.font16darkBlueMedium,
                        ),
                      ),
                      verticalSpace(30),
                      SizedBox(
                          width: double.infinity,
                          height: 41.h,
                          child: ListView.builder(
                              itemCount: widget.specialityName.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                          context
                                              .read<DoctorsCubit>()
                                              .filterBySpecialty(widget
                                                  .specialityName[index].name);
                                        });
                                      },
                                      child: Container(
                                        height: 41.h,
                                        padding: EdgeInsets.all(7.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24.r),
                                          border: selectedIndex == index
                                              ? null
                                              : Border.all(
                                                  color: ColorsManager
                                                      .liteBackground,
                                                  width: 2.0.w),
                                          color: selectedIndex == index
                                              ? ColorsManager.mainBlue
                                              : ColorsManager.liteBackground,
                                        ),
                                        child: Center(
                                            child: Text(
                                          widget.specialityName[index].name!,
                                          style: TextStyles.font14LiteGrayMediam
                                              .copyWith(
                                                  color: selectedIndex == index
                                                      ? Colors.white
                                                      : ColorsManager
                                                          .lightGray),
                                        )),
                                      ),
                                    ),
                                    horizontalSpace(8),
                                  ],
                                );
                              })),
                      verticalSpace(60),
                      AppTextButton(
                        onPressed: () => Navigator.pop(context),
                        buttonText: "Done",
                        textStyle: TextStyles.font16WhiteSemiBold,
                      )
                    ]),
              ),
            ));
  }
}
