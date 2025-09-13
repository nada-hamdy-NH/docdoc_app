import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/widgets/build_appbar.dart';
import 'package:docdoc/features/profile/presentaion/ui/widgets/logout_widget.dart';
import 'package:docdoc/features/profile/presentaion/ui/widgets/settings_list_tile.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Settings"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(24.0),
          child: Column(
            children: [
              SettingsListTile(
                onTap: () {
                  //  context.push("/notificationView");
                },
                title: 'Notification',
                image: "assets/svgs/notifications.svg",
              ),
              SettingsListTile(
                onTap: () {
                  //  context.push("/faqView");
                },
                title: 'FAQ',
                image: "assets/svgs/messages-question.svg",
              ),
              SettingsListTile(
                onTap: () {
                  // context.push("/securityView");
                },
                title: 'Security',
                image: "assets/svgs/lock.svg",
              ),
              SettingsListTile(
                onTap: () {},
                title: 'Language',
                image: "assets/svgs/language-square.svg",
              ),
              const LogOutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
