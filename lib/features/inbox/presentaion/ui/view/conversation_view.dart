import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/widgets/build_appbar.dart';
import 'package:docdoc/features/inbox/data/model/message_item_model.dart';
import 'package:docdoc/features/inbox/presentaion/ui/widget/custom_type_msg_nav_bar.dart';
import 'package:docdoc/features/inbox/presentaion/ui/widget/inbox_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ConversationView extends StatelessWidget {
  final MessageItemModel messageItemModel;
  const ConversationView({super.key, required this.messageItemModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
        context,
        title: messageItemModel.name,
        trailing: Container(
          constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
          margin: const EdgeInsetsDirectional.only(
            start: 16,
            top: 5,
            bottom: 5,
            end: 16,
          ),
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
            'assets/svgs/video_appbar.svg',
            colorFilter: const ColorFilter.mode(
              ColorsManager.darkBlue,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomTypeMessage(),
      resizeToAvoidBottomInset: false,
      body: ConversationViewBody(
        messageItemModel: messageItemModel,
      ),
    );
  }
}
