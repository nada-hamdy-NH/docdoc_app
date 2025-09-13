import 'package:bloc/bloc.dart';
import 'package:docdoc/features/payment/data/repos/payment_repo_imp.dart';
import 'package:docdoc/features/profile/data/model/logout_model.dart';
import 'package:docdoc/features/profile/data/model/profile_model/profile_model.dart';
import 'package:docdoc/features/profile/data/repo/profile_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileRepo profileRepo;
  ProfileCubit(this.profileRepo) : super(ProfileState.initial());

  Future<void> getProfile() async {
    emit(const ProfileState.loading());
    final result = await profileRepo.getProfile();
    result.when(success: (profile) {
      emit(ProfileState.success(profile));
    }, failure: (error) {
      emit(ProfileState.failure(error.message!));
    });
  }

  Future<void> logOut() async {
    emit(const ProfileState.logoutLoading());
    final result = await profileRepo.logOut();
    result.when(success: (profile) {
      emit(ProfileState.logoutSuccess(profile));
    }, failure: (error) {
      emit(ProfileState.logoutFailure(error.message!));
    });
  }
}
