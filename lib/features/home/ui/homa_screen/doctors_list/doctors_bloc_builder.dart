import 'package:docdoc/features/home/ui/homa_screen/doctors_list/doctor_shimmer_loading.dart';
import 'package:docdoc/features/home/ui/logic/home_cubit.dart';
import 'package:docdoc/features/home/ui/logic/home_state.dart';
import 'package:docdoc/features/home/ui/homa_screen/doctors_list/doctors_list_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder(specializationDataList, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (p, c) =>
          p.docsStatus != c.docsStatus || p.doctors != c.doctors,
      builder: (context, state) {
        if (state.docsStatus == LoadStatus.success) {
          return DoctorsListView(doctorsList: state.doctors);
        }
        if (state.docsStatus == LoadStatus.loading) {
          return const DoctorsShimmerLoading();
        }
        return const SizedBox.shrink();
      },
    );
  }
}

Widget setUpSuccess(doctorsList) {
  return DoctorsListView(doctorsList: doctorsList);
}
