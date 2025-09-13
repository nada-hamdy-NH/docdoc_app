import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AppointmentStatusAndDateWidget extends StatelessWidget {
  const AppointmentStatusAndDateWidget({
    super.key,
    required this.index,
    required this.color,
    required this.status,
  });

  final int index;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: VisualDensity.compact,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status,
            style: TextStyles.font12BlueRegular.copyWith(
              color: color,
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
      subtitle: Text(
        "Wed, ${index + 15} May | ${index + 9}.30 AM",
        style: TextStyles.font12GrayMedium.copyWith(
          color: const Color(0xff616161),
        ),
      ),
      trailing: GestureDetector(
        onTap: () {},
        child: const Icon(
          Icons.more_vert_rounded,
          color: ColorsManager.liteGray,
        ),
      ),
    );
  }
}
