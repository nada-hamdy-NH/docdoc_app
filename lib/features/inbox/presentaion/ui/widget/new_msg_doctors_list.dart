import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/inbox/data/model/message_item_model.dart';
import 'package:flutter/material.dart';

class NewMsgDoctorsList extends StatelessWidget {
  const NewMsgDoctorsList({
    super.key,
    required this.filteredDoctors,
  });

  final List<MessageItemModel> filteredDoctors;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          filteredDoctors.length,
          (index) {
            var fDoctors = filteredDoctors[index];
            return NewMsgDoctorItem(filteredDoctors: fDoctors);
          },
        ),
      ),
    );
  }
}

class NewMsgDoctorItem extends StatelessWidget {
  const NewMsgDoctorItem({
    super.key,
    required this.filteredDoctors,
  });

  final MessageItemModel filteredDoctors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          titleAlignment: ListTileTitleAlignment.top,
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          title: Text(
            filteredDoctors.name,
            style: TextStyles.font14BlueSemiBold,
          ),
          subtitle: Text(
              '${filteredDoctors.specialization} | ${filteredDoctors.degree}',
              style: TextStyles.font10LiteGrayRegular),
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(
              filteredDoctors.image,
            ),
          ),
        ),
        const Divider(
          color: ColorsManager.LighterGray,
        ),
      ],
    );
  }
}
