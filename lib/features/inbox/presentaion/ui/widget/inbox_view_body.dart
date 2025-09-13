import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/inbox/data/model/message_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ConversationViewBody extends StatelessWidget {
  const ConversationViewBody({super.key, required this.messageItemModel});
  final MessageItemModel messageItemModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: 6,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadiusDirectional.circular(6),
              ),
              child:
                  Text("Session Start", style: TextStyles.font10Black400Weight),
            ),
            const SizedBox(height: 30),
            BubbleSpecialThree(
              text: 'Hi, ${messageItemModel.name} 🙏',
              color: ColorsManager.mainBlue,
              tail: true,
              sent: true,
              delivered: true,
              seen: true,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const BubbleSpecialThree(
              text: 'Good morning, how can I help you?',
              color: Colors.white,
              tail: true,
              isSender: false,
              textStyle: TextStyle(
                color: ColorsManager.darkBlue,
              ),
            ),
            const SizedBox(height: 10),
            BubbleSpecialThree(
              text: messageItemModel.message1,
              color: ColorsManager.mainBlue,
              tail: true,
              sent: true,
              delivered: true,
              seen: true,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            BubbleSpecialThree(
              text: messageItemModel.message2,
              color: Colors.white,
              tail: true,
              isSender: false,
              textStyle: const TextStyle(
                color: ColorsManager.darkBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
