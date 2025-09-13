import 'package:docdoc/core/helper/extensions.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/profile/presentaion/logic/cubit/profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogoutSuccessState ) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Loggedout Successfuly'),
              backgroundColor: ColorsManager.mainBlue,
              behavior: SnackBarBehavior.floating,
            ),
          );
          Navigator.pushReplacementNamed(context, Routes.loginScreen);
        } else if (state is LogoutFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        return state is LogoutLoadingState
            ? const CupertinoActivityIndicator(
                color: ColorsManager.mainBlue,
              )
            : CupertinoAlertDialog(
                title: Text(
                  'Logout',
                  style: TextStyles.font16darkBlue600Weight.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                content: Text(
                  'You’ll need to enter your email\nand password next time\nyou want to login',
                  style: TextStyles.font12GrayRegular
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text(
                      'Cancel',
                      style: TextStyles.font14GrayRegular.copyWith(
                        color: const Color(0xff007AFF),
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      'Log Out',
                      style: TextStyles.font14GrayRegular.copyWith(
                        color: const Color(0xffFF0000),
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      context.read<ProfileCubit>()..logOut();
                    },
                  ),
                ],
              );
      },
    );
  }
}
