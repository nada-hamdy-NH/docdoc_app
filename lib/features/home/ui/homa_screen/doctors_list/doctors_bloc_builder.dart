import 'package:docdoc/features/home/logic/home_cubit.dart';
import 'package:docdoc/features/home/logic/home_state.dart';
import 'package:docdoc/features/home/ui/homa_screen/doctors_list/doctors_list_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder(specializationDataList, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is DoctorSuccess ||
            current is DoctorError , 
        builder: (context, state) {
          return state.maybeWhen(
            doctorSuccess: (doctorsList) {
              return setUpSuccess(doctorsList);
            },
            doctorError: () {
              return const SizedBox.shrink();
            },
            orElse: () => const SizedBox.shrink(),
          );
        });
      
  }
}


Widget setUpSuccess(doctorsList) {
  return   DoctorsListView(doctorsList:  doctorsList);
  
  
}

 