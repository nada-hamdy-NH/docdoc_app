import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/features/profile/presentaion/logic/cubit/profile_cubit.dart';
import 'package:docdoc/features/profile/presentaion/ui/widgets/custom_profile_info_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.14),
            BlocProvider(
              create: (_) => getIt<ProfileCubit>()..getProfile(),
              child: CustomProfileInfoSheet(),
            )
          ],
        ),
        const Positioned(
          top: 60,
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(
              "assets/images/profile_image.png",
            ),
          ),
        ),
      ],
    );
  }
}
