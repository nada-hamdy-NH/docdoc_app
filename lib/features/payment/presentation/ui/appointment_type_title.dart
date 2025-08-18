import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppointmentTypeTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color bgColor;
  final bool isSelected;
  final VoidCallback onTap;

  const AppointmentTypeTile({
    super.key,
    required this.title,
    required this.iconPath,
    required this.bgColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
        ),
      ),
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: GestureDetector(
        onTap: onTap,
        child: Icon(
          isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
          color: ColorsManager.mainBlue,
          size: 22.w,
        ),
      ),
    );
  }
}
