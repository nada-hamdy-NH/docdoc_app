import 'package:docdoc/core/helper/extensions.dart';
import 'package:docdoc/core/helper/lists.dart';
import 'package:docdoc/features/home/data/repo/home_repo.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:docdoc/features/home/ui/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(const HomeState());

  Future<void> getSpesializations() async {
    emit(state.copyWith(specStatus: LoadStatus.loading));
    final response = await homeRepo.getSpecialization();
    response.when(success: (res) {
      final list = res.specializationDataList ?? [];
      // حددي أول تخصص واخزنيه
      final firstId = list.isNotEmpty ? list.first.id : null;
      specializationDataList = list;
      emit(state.copyWith(
        specStatus: LoadStatus.success,
        specializations: list,
        selectedSpecId: firstId,
      ));
      if (firstId != null) getDoctors(firstId);
    }, failure: (_) {
      emit(state.copyWith(specStatus: LoadStatus.error));
    });
  }

  void getDoctors(int specializationId) {
    final doctors = getDoctorsListBySpecializationId(specializationId);
    if (!(doctors.isNullOrEmpty())) {
      emit(state.copyWith(
        docsStatus: LoadStatus.success,
        doctors: doctors,
        selectedSpecId: specializationId,
      ));
    } else {
      emit(state.copyWith(docsStatus: LoadStatus.error, doctors: const []));
    }
  }

  List<Doctors?>? getDoctorsListBySpecializationId(int id) {
    return state.specializations?.firstWhere((s) => s?.id == id)?.doctorsList;
  }
}
