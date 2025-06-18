

import 'package:docdoc/core/helper/extensions.dart';
import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/features/home/data/repo/home_repo.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo ; 
  HomeCubit( this.homeRepo) : super(const HomeState.initial());
List<SpecializationData?>? specializationDataList = [];
  void getSpesializations()async {
    try {
      emit(const HomeState.spesializationLoading());
      final response = await homeRepo.getSpecialization();
      response.when(success: (SpesializationResponseModel) {
        specializationDataList = SpesializationResponseModel.specializationDataList ?? [];
        getDoctors(specializationId: specializationDataList?.first?.id ?? 1);
        emit(HomeState.spesializationsSuccess( specializationDataList));
      }, failure: (errorHandler) {
        emit(HomeState.spesializationError( errorHandler));
      });

    }catch(e){
      emit(HomeState.spesializationError(ErrorHandler.handle(e)));
    }
    
  }

  void getDoctors({required int specializationId})async{
    List<Doctors?>? DoctorsList = getDoctorsListBySpecializationId(specializationId);
    if(!DoctorsList.isNullOrEmpty()){
    emit(HomeState.doctorSuccess(DoctorsList)); 
    }else{
      emit(HomeState.doctorError(ErrorHandler.handle("No Doctors")));
    }
  }

/// returns list of doctors based on specialization id
 getDoctorsListBySpecializationId(int specializationId) {
  return specializationDataList?.firstWhere(
    (specialization) => specialization?.id == specializationId)
    ?.doctorsList;
  
}
}