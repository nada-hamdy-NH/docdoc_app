import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/features/doctors/data/doctor_model/doctor_model.dart';
import 'package:docdoc/features/doctors/data/doctors_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctors_state.freezed.dart';

@freezed
class DoctorsState with _$DoctorsState {
  const factory DoctorsState.initial() = _Initial;

  const factory DoctorsState.doctorsLoading() = DoctorsLoading;

  const factory DoctorsState.doctorsSuccess(List<Doctor> doctor) =
      DoctorsSuccess;

  const factory DoctorsState.doctorsError(ApiErrorModel apiErrorModel) =
      DoctorsError;

        const factory DoctorsState.doctorLoading() = DoctorLoading;

  const factory DoctorsState.doctorSuccess(DoctorModel doctorModel) = DoctorState;

  const factory DoctorsState.doctorError(ApiErrorModel apiErrorModel) = DoctorError;
}
