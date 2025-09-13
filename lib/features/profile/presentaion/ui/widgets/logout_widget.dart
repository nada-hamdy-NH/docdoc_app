import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/features/profile/presentaion/logic/cubit/profile_cubit.dart';
import 'package:docdoc/features/profile/presentaion/ui/widgets/logout_dialog.dart';
import 'package:docdoc/features/profile/presentaion/ui/widgets/settings_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsListTile(
      onTap: () {
        var profileCubit = context.read<ProfileCubit>();
        showCupertinoDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return BlocProvider.value(
              value: profileCubit,
              child: const LogOutDialog(),
            );
          },
        );
      },
      title: 'Logout',
      image: "assets/svgs/logout.svg",
      textColor: ColorsManager.liteRed,
    );
  }
}
