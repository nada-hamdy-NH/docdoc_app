import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/features/inbox/presentaion/ui/widget/create_new_message_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CreateNewMessageBtn extends StatelessWidget {
  const CreateNewMessageBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.0),
            ),
          ),
          builder: (context) {
            return const CreateNewMessageBody();
          },
        );
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
        margin: const EdgeInsetsDirectional.only(
            start: 16, top: 5, bottom: 5, end: 16),
        padding: const EdgeInsetsDirectional.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: Colors.white,
          border: Border.all(
            color: ColorsManager.LighterGray,
            width: 1,
          ),
        ),
        child: SvgPicture.asset(
          'assets/svgs/message-add.svg',
        ),
      ),
    );
  }
}
