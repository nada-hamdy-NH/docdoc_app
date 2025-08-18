import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/features/doctors/logic/doctors_cubit.dart';
import 'package:docdoc/features/doctors/logic/doctors_state.dart';
import 'package:docdoc/features/doctors/ui/widgets/view_all_doctors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBuilder extends StatelessWidget {
  const DoctorsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsState>(
        buildWhen: (previous, current) =>
            current is DoctorsLoading ||
            current is DoctorsSuccess ||
            current is DoctorsError,
        builder: (context, state) {
          return state.maybeWhen(
            doctorsLoading: () {
              return Center(
                  child:
                      CircularProgressIndicator(color: ColorsManager.mainBlue));
            },
            doctorsSuccess: (doctorsList) {
              return setUpSuccess(doctorsList);
            },
            doctorsError: (error) {
              return const SizedBox.shrink();
            },
            orElse: () => const SizedBox.shrink(),
          );
        });
  }
}

Widget setUpSuccess(doctorsList) {
  return ViewAllDoctors(doctorsList: doctorsList);
}
