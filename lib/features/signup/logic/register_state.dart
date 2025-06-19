import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState<T> with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = SignupLoading;
  const factory RegisterState.succes(T data) = SignupSuccess<T>;
  const factory RegisterState.error(ApiErrorModel apiErrorModel)= SignupError; 
}

