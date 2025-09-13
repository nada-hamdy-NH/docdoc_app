import 'package:docdoc/core/widgets/build_header.dart';
import 'package:docdoc/core/widgets/build_header_with_trailling.dart';
import 'package:docdoc/features/appointement/ui/widgets/my_appoitment_view_body.dart';
import 'package:docdoc/features/appointement/ui/widgets/search_appbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentView extends StatelessWidget {
  const MyAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0.h, right: 8.w, left: 8.w),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60), // حدد الارتفاع المناسب
            child: buildHeaderWithTrailling("Appointments")),
        body: const MyAppointmentViewBody(),
      ),
    );
  }
}
