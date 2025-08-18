import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/doctors/data/doctors_api_service.dart';
import 'package:docdoc/features/doctors/data/doctor_model/doctor_model.dart';

class DoctorsRepo {
  final DoctorsApiService doctorsApiService;
  DoctorsRepo(this.doctorsApiService);
  
}
