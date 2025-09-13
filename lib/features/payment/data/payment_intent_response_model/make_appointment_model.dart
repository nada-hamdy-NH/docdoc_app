import 'package:docdoc/features/doctors/data/doctor/doctor.dart';
import 'package:docdoc/features/doctors/data/doctors_model.dart';

class MakeAppointmentModel {
  final DoctorModel doctorInfo;
  final String image;
  final DateTime selectedDate;
  final String selectedTime;
  final String paymentOption;
  final String appointmentType;
  MakeAppointmentModel(
      {required this.doctorInfo,
      required this.image,
      required this.selectedDate,
      required this.selectedTime,
      required this.paymentOption,
      required this.appointmentType});
}
