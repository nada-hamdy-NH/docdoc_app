import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/doctors/data/doctor/doctor.dart';
import 'package:docdoc/features/doctors/data/doctors_api_service.dart';
import 'package:docdoc/features/doctors/data/doctors_model.dart';

class DoctorsRepo {
  final DoctorsApiService doctorsApiService;
  DoctorsRepo(this.doctorsApiService);
  Future<ApiResult<DoctorsResponseModel>> getDoctors() async {
    try {
      final response = await doctorsApiService.getDoctors();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DoctorModel>> getDoctor({required String id}) async {
    try {
      final response = await doctorsApiService.getDoctor(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
