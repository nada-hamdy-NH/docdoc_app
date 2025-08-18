import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:docdoc/features/home/ui/homa_screen/doctors_list/doctor_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  const DoctorsListView({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: ListView.builder(
          itemCount: doctorsList!.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                    width: double.infinity,
                    height: 110.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: DoctorListViewItem(
                      index: index,
                      doctorsList: doctorsList,
                    )),
              )),
    );
  }
}
