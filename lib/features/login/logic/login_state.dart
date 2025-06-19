import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.Loginloading() = LoginLoading;
  const factory LoginState.Loginsuccess(T data) = LoginSuccess<T>;
  const factory LoginState.Loginerror(ApiErrorModel apiErrorModel) = LoginError;
}
