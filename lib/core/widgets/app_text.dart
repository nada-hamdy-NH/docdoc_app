import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  final String addressText;
  final String text ; 
  const AppText({super.key,required this.addressText , required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(addressText , style: TextStyles.font24BlueBold.copyWith(height: 1.6)),
          Text(text ,
            style: TextStyles.font15GrayRegular.copyWith(height: 1.6.h),)
        ],
    
    );
  }
}
