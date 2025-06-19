import 'package:docdoc/core/helper/extensions.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount
({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Don\'t have an account yet? ',
            style: TextStyles.font12GrayRegular,
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.font12BlueBold,
              recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplaceNamed(Routes.signUpScreen);
              },
          ),
        ],
      ),
    );
  }
}