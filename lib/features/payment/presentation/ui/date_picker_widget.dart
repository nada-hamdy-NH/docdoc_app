import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key, required this.onDateChange, 
  });
  final Function(dynamic date) onDateChange;

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      height: 64.h,
      initialSelectedDate: DateTime.now(),
      selectionColor: ColorsManager.mainBlue,
      selectedTextColor: Colors.white,
      dateTextStyle: TextStyles.font12GrayMedium,
      monthTextStyle: TextStyle(fontSize: 0),
      dayTextStyle: TextStyles.font12GrayMedium,
      locale: 'en',
      onDateChange: onDateChange,
    );
  }
}
