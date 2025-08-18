import 'package:docdoc/features/doctors/data/doctors_model.dart';
import 'package:docdoc/features/doctors/ui/widgets/doctors_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewAllDoctors extends StatelessWidget {
  final List<Doctor> doctorsList;
  const ViewAllDoctors({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 575.h,
        width: 343.w,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          itemCount: doctorsList.length,
          itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: Container(
                  width: double.infinity,
                  height: 126.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF000000).withOpacity(0.04),
                          spreadRadius: 0,
                          blurRadius: 30,
                          blurStyle: BlurStyle.normal,
                          offset: const Offset(
                            0, -5, // changes position of shadow
                          ),
                        ),
                      ]),
                  child: DoctorsListItem(
                    doctorsList: doctorsList,
                    index: index,
                  ))),
        ));
  }
}
