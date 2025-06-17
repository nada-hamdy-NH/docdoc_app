

import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo ; 
  HomeCubit( this.homeRepo) : super(const HomeState.initial());

  void getSpesializations()async {
    try {
      emit(const HomeState.spesializationLoading());
      final response = await homeRepo.getSpecialization();
      response.when(success: (SpesializationResponseModel) {
        emit(HomeState.spesializationsSuccess( SpesializationResponseModel));
      }, failure: (errorHandler) {
        emit(HomeState.spesializationError( errorHandler));
      });

    }catch(e){
      emit(HomeState.spesializationError(ErrorHandler.handle(e)));
    }
    
  }
}
