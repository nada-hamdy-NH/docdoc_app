import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_constants.dart';
import 'package:docdoc/features/doctors/data/doctors_constants.dart';
import 'package:docdoc/features/doctors/data/doctors_model.dart';
import 'package:docdoc/features/doctors/data/doctor_model/doctor_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'doctors_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class DoctorsApiService {
  factory DoctorsApiService(Dio dio, {String baseUrl}) = _DoctorsApiService;
  @GET(DoctorsConstants.doctors)
  Future<DoctorsResponseModel> getDoctors();


  @GET("${DoctorsConstants.doctor}{id}")
Future<DoctorModel> getDoctor(@Path("id") String id);
}
