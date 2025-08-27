import 'package:docdoc/features/appointement/ui/appointement.dart';
import 'package:docdoc/features/home/ui/homa_screen/home_screen.dart';
import 'package:docdoc/features/home/ui/home/widgets/bottom_app_bar_widget.dart';
import 'package:docdoc/features/home/ui/home/widgets/bottom_bar_icons.dart';
import 'package:docdoc/features/home/ui/home/widgets/rounded_containers.dart';
import 'package:docdoc/features/home/ui/logic/home_cubit.dart';
import 'package:docdoc/features/messages/ui/messages_screen.dart';
import 'package:docdoc/features/profile/ui/profile.dart';
import 'package:docdoc/features/search/ui/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    final cubit = context.read<HomeCubit>();
    if (cubit.state.specializations == null ||
        cubit.state.specializations!.isEmpty) {
      cubit.getSpesializations();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            MessagesScreen(),
            SearchScreen(),
            AppointementScreen(),
            ProfileScreen(),
          ],
          onPageChanged: (value) {
            setState(() {
              pageController.jumpToPage(value);
            });
          },
        ),
        const BottomAppBarWidget(),
        RoundedContainers(
          pageController: pageController,
        ),
        BottomBarIcons(
          pageController: pageController,
        )
      ]),
    );
  }
}
