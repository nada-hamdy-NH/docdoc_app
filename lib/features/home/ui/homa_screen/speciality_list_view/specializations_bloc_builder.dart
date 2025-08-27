import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:docdoc/features/home/ui/logic/home_cubit.dart';
import 'package:docdoc/features/home/ui/logic/home_state.dart';
import 'package:docdoc/features/home/ui/homa_screen/doctors_list/doctor_shimmer_loading.dart';
import 'package:docdoc/features/home/ui/homa_screen/speciality_list_view/speciality_list_view.dart';
import 'package:docdoc/features/home/ui/homa_screen/speciality_list_view/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  List<SpecializationData?>? spesializationDataList;
  SpecializationsBlocBuilder({super.key, this.spesializationDataList});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (p, c) =>
          p.specStatus != c.specStatus ||
          p.specializations != c.specializations,
      builder: (context, state) {
        if (state.specStatus == LoadStatus.loading) return setUpLoading();
        if (state.specStatus == LoadStatus.success) {
          return setUpSuccess(state.specializations, context);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

//shimmerLoading

Widget setUpLoading() {
  return const Expanded(
    child: Column(
      children: [SpecialityShimmerLoading(), DoctorsShimmerLoading()],
    ),
  );
}

Widget setUpSuccess(spesializationDataList, context) {
  return Column(
    children: [
      SpecialityListView(specializationDataLst: spesializationDataList ?? []),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Row(
          children: [
            Text(
              "Recommendation Doctor",
              style: TextStyles.font18darkBlueSemiBold,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.doctorScreen),
              child: Text(
                "See All",
                style: TextStyles.font12BlueRegular,
              ),
            )
          ],
        ),
      ),
    ],
  );
}
