import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/profile/presentaion/ui/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.mainBlue,
        appBar: AppBar(
          backgroundColor: ColorsManager.mainBlue,
          surfaceTintColor: Colors.transparent,
          title: Text(
            'Profile',
            style: TextStyles.font18Black600Weight.copyWith(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.settings);
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 16),
                child: SvgPicture.asset(
                  'assets/svgs/setting-2.svg',
                ),
              ),
            ),
          ],
          leading: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
        body: const ProfileViewBody(),
      ),
    );
  }
}
