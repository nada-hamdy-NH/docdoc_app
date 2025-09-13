import 'package:docdoc/core/helper/app_regex.dart';
import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/app_text.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 50, bottom: 26, start: 16, end: 16),
          child: Form(
            child: Column(
              children: [
                const AppText(
                    addressText: "Welcome Back",
                    text:
                        "We're excited to have you back, can't wait to see what you've been up to since you last logged in."),
                verticalSpace(35),
                AppTextFormField(
                  hintText: "Email",
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return "Please enter a valid email";
                    }
                  },
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                  child: AppTextButton(
                    onPressed: () {},
                    buttonText: "Reset Password",
                    textStyle: TextStyles.font16WhiteSemiBold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
