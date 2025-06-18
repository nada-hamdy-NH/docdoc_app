import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
 final List<Doctors?>? doctorsList ;
  const DoctorsListView({super.key ,required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
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
                          borderRadius: BorderRadius.circular(16.r)
                        ),
                        child: Row(
                          children: [
                         Image.asset("assets/images/doctor1.png",width: 110.w,height: 110.h,),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(doctorsList![index]!.name!,style: TextStyles.font18darkBlueSemiBold,),
                              SizedBox(height: 8.h,),
                              Text("${doctorsList![index]!.degree} | ${doctorsList![index]!.phone}",style: TextStyles.font12GrayMedium),
                              SizedBox(height: 8.h,),
                              Text(doctorsList![index]!.email!,style: TextStyles.font12GrayMedium,)
                              
                                                  ]),
                          )
                                          ]),
                      ),
                    )
                                 ),
                );
  }
}