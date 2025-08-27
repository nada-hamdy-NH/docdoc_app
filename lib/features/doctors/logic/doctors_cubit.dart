import 'package:bloc/bloc.dart';
import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/features/doctors/data/doctor_model/doctor_model.dart';
import 'package:docdoc/features/doctors/data/doctors_model.dart';
import 'package:docdoc/features/doctors/data/repo/doctors_repo.dart';
import 'package:flutter/widgets.dart';

import 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  DoctorsRepo doctorsRepo;
  DoctorsCubit(this.doctorsRepo) : super(DoctorsState.initial());
  List<Doctor> doctors = [];

  void getDoctors() async {
    emit(const DoctorsState.doctorsLoading());
    final response = await doctorsRepo.getDoctors();
    response.when(success: (DoctorsResponseModel doctorsResponseModel) {
      doctors = doctorsResponseModel.doctors ?? [];
      emit(DoctorsState.doctorsSuccess(doctorsResponseModel.doctors!));
    }, failure: (ApiErrorModel apiErrorModel) {
      emit(DoctorsState.doctorsError(apiErrorModel));
    });
  }

  Future<void> getDoctor(String id) async {
    emit(const DoctorsState.doctorLoading());
    final response = await doctorsRepo.getDoctor(id: id);
    response.when(success: (DoctorModel doctorModel) {
      emit(DoctorsState.doctorSuccess(doctorModel));
    }, failure: (ApiErrorModel apiErrorModel) {
      emit(DoctorsState.doctorsError(apiErrorModel));
    });
  }

  void filterBySpecialty(String? specialty) {
    if (specialty == null || "All" == specialty) {
      emit(DoctorsState.doctorsSuccess(doctors));
      return;
    }
    final filtered =
        doctors.where((doc) => doc.specialization!.name == specialty).toList();

    emit(DoctorsState.doctorsSuccess(filtered));
  }

  void searchByName(String query) {
    final filtered = doctors
        .where((doctor) =>
            doctor.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(DoctorsState.doctorsSuccess(filtered));
  }
}
