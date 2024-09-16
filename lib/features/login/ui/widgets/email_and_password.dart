import 'package:docdoc/core/helper/app_regex.dart';
import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/widgets/app_text_form_field.dart';
import 'package:docdoc/features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:docdoc/features/login/logic/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;
  bool isObscureText = true;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
      hasLowercase = AppRegex.hasLowercase(passwordController.text);
      hasUppercase = AppRegex.hasUppercase(passwordController.text);
      hasNumber = AppRegex.hasNumber(passwordController.text);
      hasSpecialCharacters = AppRegex.hasSpecialCharacters(passwordController.text);
      hasMinLength = AppRegex.hasMinLength(passwordController.text);
      
    });
  
  });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            validator: (value) {
              // ignore: unnecessary_null_comparison
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return "Please enter a valid email";
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: "Password",
            controller: context.read<LoginCubit>().passwordController,
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child:
                  Icon(isObscureText ? Icons.visibility : Icons.visibility_off),
            ),
            validator: (value) {
              // ignore: unnecessary_null_comparison
              if (value == null || value.isEmpty) {
                return "Please enter a valid password";
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            haseLowerCase: hasLowercase,
            haseUpperCase: hasUppercase,
            haseNumber: hasNumber,
            haseSpecialCharacters: hasSpecialCharacters,
            haseMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}