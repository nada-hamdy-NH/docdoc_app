import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/features/login/data/models/login_request_body.dart';
import 'package:docdoc/features/login/logic/login_cubit.dart';
import 'package:docdoc/features/login/ui/widgets/email_and_password.dart';
import 'package:docdoc/features/login/ui/widgets/login_block_listener.dart';
import 'package:docdoc/features/login/ui/widgets/signUp.dart';
import 'package:docdoc/features/login/ui/widgets/text_for_policies_and_signup.dart';
import 'package:docdoc/features/login/ui/widgets/text_of_login_screen.dart';
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
                const TextOfLoginScreen(),
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
                const TextForPoliciesAndSignup(),
                verticalSpace(60),
                const TextHaveAnAccount(),
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
    context.read<LoginCubit>().emitLoginState(
      LoginRequestBody(
        email: context.read<LoginCubit>().emailController.text,
        password: context.read<LoginCubit>().passwordController.text,
      ));
  }
}
