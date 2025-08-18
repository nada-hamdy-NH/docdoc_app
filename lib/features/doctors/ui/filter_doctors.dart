import 'package:docdoc/core/helper/lists.dart';
import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/arrow_back_container.dart';
import 'package:docdoc/features/doctors/logic/doctors_cubit.dart';
import 'package:docdoc/features/doctors/ui/widgets/doctors_builder.dart';
import 'package:docdoc/features/doctors/ui/widgets/filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterDoctorsScreen extends StatefulWidget {
  const FilterDoctorsScreen({super.key});

  @override
  State<FilterDoctorsScreen> createState() => _FilterDoctorsScreenState();
}

class _FilterDoctorsScreenState extends State<FilterDoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.0.h, horizontal: 20.w),
        child: Column(
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
                          color: ColorsManager.LighterGray, width: 1.0.w),
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
            Row(children: [
              Container(
                  height: 46.0.h,
                  width: 303.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0.r),
                    color: ColorsManager.SomeLiteGray,
                  ),
                  child: TextField(
                      onChanged: (value) {
                        context.read<DoctorsCubit>().searchByName(value);
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 15.h),
                          border: InputBorder.none,
                          fillColor: ColorsManager.SomeLiteGray,
                          hintText: "Search",
                          hintStyle: TextStyles.font12LiteGrayMediam,
                          prefixIcon: Image.asset(
                            "assets/images/search-normal-gray.png",
                            width: 12.w,
                            height: 12.h,
                          )))),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent, // اختياري
                    builder: (_) => BlocProvider.value(
                      value: context.read<DoctorsCubit>(),
                      child: FilterDialog(
                        specialityName: specializationDataList ?? [],
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.filter_list_sharp,
                  color: ColorsManager.darkBlue,
                  size: 24.w,
                ),
              )
            ]),
            verticalSpace(22),
            const Expanded(child: DoctorsBuilder())
          ],
        ),
      ),
    ));
  }
}
