import 'package:docdoc/core/helper/extensions.dart';
import 'package:docdoc/core/helper/lists.dart';
import 'package:docdoc/features/home/data/repo/home_repo.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(const HomeState.initial());
  void getSpesializations() async {
    emit(const HomeState.spesializationLoading());
    final response = await homeRepo.getSpecialization();
    response.when(success: (SpesializationResponseModel) {
      specializationDataList =
          SpesializationResponseModel.specializationDataList ?? [];
      getDoctors(specializationId: specializationDataList?.first.id ?? 1);
      emit(HomeState.spesializationsSuccess(specializationDataList));
    }, failure: (apiErrorModel) {
      emit(HomeState.spesializationError(apiErrorModel));
    });
  }

  void getDoctors({required int specializationId}) async {
    List<Doctors?>? doctorsList =
        getDoctorsListBySpecializationId(specializationId);
    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorSuccess(doctorsList));
    } else {
      emit(const HomeState.doctorError());
    }
  }

  /// returns list of doctors based on specialization id
  getDoctorsListBySpecializationId(int specializationId) {
    return specializationDataList
        ?.firstWhere((specialization) => specialization.id == specializationId)
        .doctorsList;
  }
}
