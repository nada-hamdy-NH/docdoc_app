import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindNearButton extends StatelessWidget {
  const FindNearButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Container(
          height: 167.h,
          width: double.infinity,
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/Background.png",
                ),
              ),
              borderRadius: BorderRadius.circular(16.r)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Book and \nschedule with \nnearest doctor",
                style: TextStyles.font18Whitemedium,
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(109.w, 38.h),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(48.r)),
                    ),
                    child: Text(
                      "Find Nearby",
                      style: TextStyles.font12BlueRegular,
                    )),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
