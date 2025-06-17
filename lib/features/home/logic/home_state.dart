
import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part  'home_state.freezed.dart';
@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.spesializationLoading() = SpesializationLoading;

  const factory HomeState.spesializationsSuccess(SpesializationResponseModel spesializationResponseModel  ) =SpesializationSuccess;

  const factory HomeState.spesializationError(ErrorHandler errorHandler) = SpesializationError;
}
