
import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part  'home_state.freezed.dart';
@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // Spesialization
  const factory HomeState.spesializationLoading() = SpesializationLoading;
  const factory HomeState.spesializationsSuccess(List<SpecializationData?>? specializationDataList) =SpesializationSuccess;
  const factory HomeState.spesializationError(ApiErrorModel apiErrorModel) = SpesializationError;

  //Doctors
  const factory HomeState.doctorSuccess(List<Doctors?>? doctorsList) = DoctorSuccess;
  const factory HomeState.doctorError() = DoctorError;
}
