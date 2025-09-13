import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class CreateNewMsgAppBar extends StatelessWidget {
  const CreateNewMsgAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: ColorsManager.darkBlue,
              size: 27,
            ),
          ),
          Text(
            "Create New Message",
            style: TextStyles.font18Black600Weight.copyWith(
              color: ColorsManager.darkBlue,
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
