import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class TextHaveAnAccount extends StatelessWidget {
  const TextHaveAnAccount
({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Already have an account yet? ',
            style: TextStyles.font12GrayRegular,
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.font12BlueBold,
          ),
        ],
      ),
    );
  }
}