import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'make_appointment_state.dart';
part 'make_appointment_cubit.freezed.dart';

class MakeAppointmentCubit extends Cubit<MakeAppointmentState> {
  MakeAppointmentCubit() : super(MakeAppointmentState.initial());
}
