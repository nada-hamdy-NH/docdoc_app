import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/inbox/data/model/message_item_model.dart';

import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.filteredMessages,
  });

  final MessageItemModel filteredMessages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          titleAlignment: ListTileTitleAlignment.top,
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(filteredMessages.name, style: TextStyles.font14BlueSemiBold),
              Text(
                  "${filteredMessages.specialization} | ${filteredMessages.degree}",
                  style: TextStyles.font10LiteGrayRegular),
              const SizedBox(height: 8),
            ],
          ),
          subtitle: Text(filteredMessages.message2,
              style: TextStyles.font12GrayRegular),
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(
              filteredMessages.image,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(filteredMessages.time, style: TextStyles.font12GrayRegular),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 20,
                  minWidth: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: filteredMessages.isUnread
                      ? ColorsManager.mainBlue
                      : Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 6.5,
                    end: 6.5,
                    top: 2.5,
                    bottom: 2.5,
                  ),
                  child: Text(
                    filteredMessages.numberOfUnreadMessages!,
                    style: TextStyles.font10LiteGrayRegular.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: ColorsManager.LighterGray,
        ),
      ],
    );
  }
}
