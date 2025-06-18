import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/logic/home_cubit.dart';
import 'package:docdoc/features/home/logic/home_state.dart';
import 'package:docdoc/features/home/ui/homa_screen/doctors_list/doctor_shimmer_loading.dart';
import 'package:docdoc/features/home/ui/homa_screen/speciality_list_view/speciality_list_view.dart';
import 'package:docdoc/features/home/ui/homa_screen/speciality_list_view/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is SpesializationLoading ||
            current is SpesializationSuccess ||
            current is SpesializationError,
        builder: (context, state) {
          return state.maybeWhen(
            spesializationLoading: () {
              return setUpLoading();
            },
            spesializationsSuccess: (specializationDataList) {
              var spesializationDataList = specializationDataList;
              return setUpSuccess(spesializationDataList);
            },
            spesializationError: (errorHandler) {
              return const SizedBox.shrink();
            },
            orElse: () => const SizedBox.shrink(),
          );
        });
  }
}

//shimmerLoading

Widget setUpLoading() {
  return const Expanded(
    child:  Column(
      children: [
      SpecialityShimmerLoading() ,
    DoctorsShimmerLoading() 
    
      ],
    ),
  );
  

  
}


Widget setUpSuccess(spesializationDataList) {
  return Column(
    children: [
      SpecialityListView(specializationDataLst: spesializationDataList ?? []),
      Padding(
        padding:  EdgeInsets.symmetric(vertical: 15.h),
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
    ],
  );
}
