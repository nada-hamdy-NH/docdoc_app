import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/home/data/home_api_service.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';

class HomeRepo {
  final HomeApiService homeApiService;
  HomeRepo(this.homeApiService);
  Future<ApiResult<SpesializationResponseModel>> getSpecialization() async {
    try {
      final response = await homeApiService.getSpecialization();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
