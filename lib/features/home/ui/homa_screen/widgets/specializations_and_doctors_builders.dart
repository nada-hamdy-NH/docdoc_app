import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/logic/home_cubit.dart';
import 'package:docdoc/features/home/logic/home_state.dart';
import 'package:docdoc/features/home/ui/homa_screen/widgets/doctor_speciality.dart';
import 'package:docdoc/features/home/ui/homa_screen/widgets/doctors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsAndDoctorsBuilders extends StatelessWidget {
  const SpecializationsAndDoctorsBuilders({super.key});

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
            spesializationsSuccess: (spesializationResponseModel) {
              var spesializationDataList =
                  spesializationResponseModel.specializationDataList;
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

Widget setUpLoading() {
  return const SizedBox(
    height: 100,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget setUpError() {
  return const Center(
    child: Text("Error"),
  );
}

Widget setUpSuccess(spesializationDataList) {
  return Expanded(
    child: Column(
      children: [
        DoctorSpeciality(specializationDataLst: spesializationDataList ?? []),
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
        DoctorsWidget(doctorsList: spesializationDataList?[0]?.doctorsList),
      ],
    ),
  );
}
