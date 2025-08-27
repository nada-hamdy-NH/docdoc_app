import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:docdoc/core/utils/stripe_service.dart/stripe_service.dart';
import 'package:docdoc/features/doctors/data/doctors_api_service.dart';
import 'package:docdoc/features/doctors/data/repo/doctors_repo.dart';
import 'package:docdoc/features/doctors/logic/doctors_cubit.dart';
import 'package:docdoc/features/home/data/home_api_service.dart';
import 'package:docdoc/features/home/data/repo/home_repo.dart';
import 'package:docdoc/features/home/ui/logic/home_cubit.dart';
import 'package:docdoc/features/login/data/repos/login_repo.dart';
import 'package:docdoc/features/login/logic/login_cubit.dart';
import 'package:docdoc/features/payment/data/payment_api_service_temp.dart';
import 'package:docdoc/features/payment/data/repos/payment_repo_imp.dart';
import 'package:docdoc/features/payment/presentation/logic/cubit/payment_cubit.dart';
import 'package:docdoc/features/signup/data/repos/register_repo.dart';
import 'package:docdoc/features/signup/logic/register_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  //Dio $ ApiService
  Dio appDio = DioFactory.getAppDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(appDio));

//login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //signup
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  ///home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(appDio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));

  ///Doctors
  getIt.registerLazySingleton<DoctorsApiService>(
      () => DoctorsApiService(appDio));
  getIt.registerLazySingleton<DoctorsRepo>(() => DoctorsRepo(getIt()));
  getIt.registerFactory<DoctorsCubit>(() => DoctorsCubit(getIt()));

  ///payment
  Dio stripeDio = DioFactory.getStripeDio();
  getIt.registerLazySingleton<PaymentApiService>(
      () => PaymentApiService(stripeDio));
  getIt.registerLazySingleton<StripeService>(() => StripeService(getIt()));
  getIt.registerLazySingleton<PaymentRepoImp>(() => PaymentRepoImp(getIt()));
  getIt.registerFactory<PaymentCubit>(() => PaymentCubit(getIt()));
}
