import 'package:docdoc/core/helper/extensions.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/login/logic/login_cubit.dart';
import 'package:docdoc/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlockListener extends StatelessWidget {
  const LoginBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                  child:
                      CircularProgressIndicator(color: ColorsManager.mainBlue)),
            );
          },
          success: (data) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      icon: const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 32,
                      ),
                      content:
                          Text(error, style: TextStyles.font15DarkBlueMedium),
                      actions: [
                        TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text("Got it",
                                style: TextStyles.font14BlueSemiBold))
                      ],
                    ));
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
