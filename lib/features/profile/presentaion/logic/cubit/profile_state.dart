part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = GetProfileLoadingState;
  const factory ProfileState.success(ProfileModel profile) = GetProfileSuccessState;
  const factory ProfileState.failure(String errMessage) =  GetProfileFailureState;

      const factory ProfileState.logoutSuccess(LogoutModel logoutModel) = LogoutSuccessState;
  const factory ProfileState.logoutFailure(String errMessage) = LogoutFailureState;
  const factory ProfileState.logoutLoading() = LogoutLoadingState;
}