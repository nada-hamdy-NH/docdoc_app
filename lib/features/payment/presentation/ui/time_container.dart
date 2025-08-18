import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeContainer extends StatelessWidget {
  const TimeContainer({
    super.key,
    required this.selectedContainer,
    required this.availableTime,
    required this.index,
  });

  final int selectedContainer;
  final String availableTime;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selectedContainer == index
            ? ColorsManager.mainBlue
            : ColorsManager.liteBackground,
        borderRadius: BorderRadius.all(Radius.circular(14.r)),
      ),
      width: 158,
      height: 49,
      child: Center(
        child: Text(
          availableTime,
          style: TextStyles.font14Whitemedium.copyWith(
            color: selectedContainer == index
                ? Colors.white
                : ColorsManager.liteGray,
          ),
        ),
      ),
    );
  }
}
