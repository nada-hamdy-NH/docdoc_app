import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/doctors/data/doctor/doctor.dart';
import 'package:docdoc/features/doctors/data/doctors_model.dart';
import 'package:flutter/material.dart';

class LocationTab extends StatelessWidget {
  const LocationTab({super.key, required this.doctor});
  final DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Practice Place', style: TextStyles.font16darkBlue600Weight),
            const SizedBox(height: 12),
            Text(
              doctor.data?.address ?? " ",
              style: TextStyles.font14GrayRegular,
            ),
            const SizedBox(height: 24),
            Text('Location Map', style: TextStyles.font16darkBlue600Weight),
            const SizedBox(height: 12),
            Image.asset(
              'assets/images/Map.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
