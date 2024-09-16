import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class TextForPolicies extends StatelessWidget {
  const TextForPolicies({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text:TextSpan(
        children: <TextSpan>[
        TextSpan(
          text: 'By logging you agree to our ',
          style: TextStyles.font12GrayRegular),
          TextSpan(
                text: 'Terms & Conditions',
                style: TextStyles.font13DarkBlueMedium,
              ),
              TextSpan(text: ' and ', style: TextStyles.font12GrayRegular),
                TextSpan(text: 'Privacy Policy .',
                style: TextStyles.font13DarkBlueMedium,


      )])

    );
  }
}
