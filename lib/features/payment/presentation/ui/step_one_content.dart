import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:docdoc/features/payment/presentation/ui/times.dart';
import 'package:flutter/material.dart';

import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/features/payment/presentation/ui/appointment_type_title.dart';
import 'package:docdoc/features/payment/presentation/ui/avaliable_time.dart';
import 'package:docdoc/features/payment/presentation/ui/date_picker_widget.dart';
import 'package:docdoc/features/payment/presentation/ui/section_title.dart';

class StepOneContent extends StatelessWidget {
  final String availableTime;
  final int selectedContainer;
  final int selectedAppointmentTypeIndex;
  final List<Map<String, String>> appointmentTypes;
  final ValueChanged<int> onTimeSelect;
  final ValueChanged<int> onTypeSelect;
   final ValueChanged<DateTime> onDateSelect;
   

   StepOneContent({
    super.key,
    required this.availableTime,
    required this.selectedContainer,
    required this.selectedAppointmentTypeIndex,
    required this.appointmentTypes,
    required this.onTimeSelect,
    required this.onTypeSelect,
    required this.onDateSelect,
  });
  
  List<String> times = generateDynamicSlots(
  startHour: 14,
  endHour: 20,
  slotsCount: 6,
);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle("Select Date", action: "Set Manual"),
         Padding(
          padding:const EdgeInsets.symmetric(horizontal: 16),
          child: DatePickerWidget(
             onDateChange: (date) {
              onDateSelect(date); // 👈 يبعته للـ parent
            },
          ),
        ),
        sectionTitle("Available time"),


        AvailableTimeGrid(
          availableTimes: times  ,
          selectedContainer: selectedContainer,
          onSelect: onTimeSelect,
        ),
        sectionTitle("Appointment Type"),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: appointmentTypes.length,
          separatorBuilder: (_, __) =>
              const Divider(color: ColorsManager.LighterGray, height: 1),
          itemBuilder: (context, index) {
            final type = appointmentTypes[index];
            return AppointmentTypeTile(
              title: type["title"]!,
              iconPath: type["icon"]!,
              bgColor: Color(int.parse(type["bgColor"]!)),
              isSelected: selectedAppointmentTypeIndex == index,
              onTap: () => onTypeSelect(index),
            );
          },
        ),
      ],
    );
  }
}
