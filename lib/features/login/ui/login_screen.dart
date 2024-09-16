import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/app_text.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/features/login/logic/login_cubit.dart';
import 'package:docdoc/features/login/ui/widgets/email_and_password.dart';
import 'package:docdoc/features/login/ui/widgets/login_block_listener.dart';
import 'package:docdoc/features/login/ui/widgets/dont_have_account.dart';
import 'package:docdoc/features/login/ui/widgets/text_for_policies_and_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 74.h, horizontal: 31.63.w),
            child: Column(
              children: [
                const AppText(
                    addressText: "Welcome Back",
                    text:
                        "We're excited to have you back, can't wait to see what you've been up to since you last logged in."),
                verticalSpace(35),
                const EmailAndPassword(),
                verticalSpace(24),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    "Forgot password?",
                    style: TextStyles.font13BlueRegular,
                  ),
                ),
                verticalSpace(40),
                AppTextButton(
                    textStyle: TextStyles.font16WhiteSemiBold,
                    buttonText: "Login",
                    onPressed: () {
                      validateThenDoLogin(context);
                    }),
                verticalSpace(16),
                const TextForPolicies(),
                verticalSpace(60),
                const DontHaveAnAccount(),
                const LoginBlockListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    context.read<LoginCubit>().emitLoginState();
  }
}
