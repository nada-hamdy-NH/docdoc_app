
import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_constants.dart';
import 'package:docdoc/features/home/data/home_constants.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'home_api_service.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {

  factory HomeApiService(Dio dio, 
  {String baseUrl}) = _HomeApiService;
  @GET(HomeConstants.specialization)
  Future<SpesializationResponseModel> getSpecialization();
}