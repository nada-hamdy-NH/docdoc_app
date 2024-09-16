import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:docdoc/features/login/data/repos/login_repo.dart';
import 'package:docdoc/features/login/logic/login_cubit.dart';
import 'package:docdoc/features/signup/data/repos/register_repo.dart';
import 'package:docdoc/features/signup/logic/register_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  //Dio $ ApiService
  Dio dio = DioFactory.getDio(); 
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

//login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //signup
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
}
