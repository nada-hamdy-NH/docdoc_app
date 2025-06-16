import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Doctors extends StatelessWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
                  height: 200.h,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 3,
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
                              Text("Dr. Randy Wigham",style: TextStyles.font18darkBlueSemiBold,),
                              SizedBox(height: 8.h,),
                              Text("General | RSUD Gatot Subroto",style: TextStyles.font12GrayMedium),
                              SizedBox(height: 8.h,),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/svgs/magic-star.svg" , width: 16.w,height: 16.h,),
                                  Text("4.8 (4,279 reviews)",style: TextStyles.font12GrayMedium,)
                                ],
                              )
                              
                                                  ]),
                          )
                                          ]),
                      ),
                    )
                                 ),
                );
  }
}