import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/appointement/ui/widgets/cancelled_page.dart';
import 'package:docdoc/features/appointement/ui/widgets/compelleted_page.dart';
import 'package:docdoc/features/appointement/ui/widgets/upcomming_page.dart';
import 'package:flutter/material.dart';

class MyAppointmentViewBody extends StatelessWidget {
  const MyAppointmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: EdgeInsetsDirectional.all(16),
        child: Column(
          children: [
            TabBar(
              labelColor: ColorsManager.mainBlue,
              unselectedLabelColor: ColorsManager.liteGray,
              indicatorColor: ColorsManager.mainBlue,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyles.font14BlueBold,
              unselectedLabelStyle: TextStyles.font14DarkBlueBold,
              dividerColor: ColorsManager.LighterGray,
              dividerHeight: 2,
              tabs: [
                Tab(text: 'Upcoming'),
                Tab(text: 'Completed'),
                Tab(text: 'Cancelled'),
              ],
            ),
            Expanded(
              child: TabBarView(
                clipBehavior: Clip.none,
                children: [
                  UpComingPage(),
                  CompletedPage(),
                  CancelledPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
