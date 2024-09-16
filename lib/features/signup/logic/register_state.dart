import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState<T> with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = SignupLoading;
  const factory RegisterState.succes(T data) = SignupSuccess<T>;
  const factory RegisterState.error({required String error})= SignupError; 
}

