import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/profile/data/model/profile_model/profile_model.dart';
import 'package:docdoc/features/profile/data/profile_api_service.dart';

class ProfileRepo {
  ProfileApiService profileApiService;

  ProfileRepo(this.profileApiService);

  @override
  Future<ApiResult> getProfile() async {
    try {
      final response = await profileApiService.getProfile();

      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult> logOut() async {
    try {
      final response = await profileApiService.logOut();

      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
