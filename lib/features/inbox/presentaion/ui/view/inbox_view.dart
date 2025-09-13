import 'package:docdoc/core/widgets/build_appbar.dart';
import 'package:docdoc/features/inbox/presentaion/ui/widget/create_new_message_btn.dart';
import 'package:docdoc/features/inbox/presentaion/ui/widget/messages_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Messages',
        trailing: const CreateNewMessageBtn(),
      ),
      body: const MessagesViewBody(),
    );
  }
}
