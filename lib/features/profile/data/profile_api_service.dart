import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_constants.dart';
import 'package:docdoc/features/profile/data/model/logout_model.dart';
import 'package:docdoc/features/profile/data/model/profile_model/profile_model.dart';
import 'package:docdoc/features/profile/data/profile_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'profile_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String baseUrl}) = _ProfileApiService;
  @GET(ProfileConstants.profile)
  Future<ProfileModel> getProfile();

  @POST(ProfileConstants.logout)
  Future<LogoutModel> logOut();
}
