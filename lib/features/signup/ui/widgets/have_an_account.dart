
import 'package:docdoc/core/helper/extensions.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount
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
            text: 'Login',
            style: TextStyles.font12BlueBold,
              recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplaceNamed(Routes.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}