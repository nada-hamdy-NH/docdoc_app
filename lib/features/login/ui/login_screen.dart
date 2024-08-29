import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/core/widgets/app_text_form_field.dart';
import 'package:docdoc/features/login/ui/widgets/signUp.dart';
import 'package:docdoc/features/login/ui/widgets/text_for_policies_and_signup.dart';
import 'package:docdoc/features/login/ui/widgets/text_of_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;

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
                const AppTextFormField(hintText: "Email"),
                verticalSpace(18),
                AppTextFormField(
                  hintText: "Password",
                  isObscureText: isObscureText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState((){
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(isObscureText
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
                verticalSpace(24),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    "Forgot password?",
                    style: TextStyles.font13BlueRegular,
                  ),
                ),
                verticalSpace(40),
                
                AppTextButton(textStyle: TextStyles.font16WhiteSemiBold, buttonText: "Login", onPressed: (){}),
                verticalSpace(16),
                /*Row(
                  children: [
                    const Expanded(flex: 1, child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or sign in with",
                          style: TextStyles.font12GrayRegular),
                    ),
                    const Expanded(flex: 1, child: Divider()),
                  ],
                ),*/
              /*  SizedBox(
                  height: 35.h,
                ),*/
                /*const IconsOfLoginWith(),
                SizedBox(
                  height: 35.h,
                ),*/
                const TextForPoliciesAndSignup(),
                verticalSpace(60),
                const TextHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
