import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/features/appointement/ui/logic/my_appointment_state.dart';
import 'package:docdoc/features/appointement/ui/widgets/upmomming_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpComingPage extends StatelessWidget {
  const UpComingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          3,
          (index) {
            return MyAppointmentUpComingItem(
              index: index,
            );
          },
        ),
      ),
    );
  }
}
