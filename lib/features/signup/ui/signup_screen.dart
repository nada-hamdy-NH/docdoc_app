import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/app_text.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/features/login/ui/widgets/text_for_policies_and_signup.dart';
import 'package:docdoc/features/signup/logic/register_cubit.dart';
import 'package:docdoc/features/signup/ui/widgets/have_an_account.dart';
import 'package:docdoc/features/signup/ui/widgets/register_block_listener.dart';
import 'package:docdoc/features/signup/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 74.h, horizontal: 31.63.w),
            child: Column(
              children: [
                  const AppText(addressText: "Create Account" ,
                  text: "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!"
                  ),
                  verticalSpace(35),
                const SignUpForm() ,
                verticalSpace(24),
                AppTextButton(
                    textStyle: TextStyles.font16WhiteSemiBold,
                    buttonText: "Create Account",
                    onPressed:() {
                      validateThenDoRegister(context);
                    }),
                verticalSpace(16),
                const TextForPolicies(),
                verticalSpace(60),
                const HaveAnAccount(),
                const RegisterBlockListener(),
              ],
            ),
          ),
        ),
      ),
    );
    
    
    
  }
  
  void validateThenDoRegister(BuildContext context) {
    if(context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitRegisterState();
    }
    
  }
}
