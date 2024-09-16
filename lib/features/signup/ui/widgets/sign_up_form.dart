import 'package:docdoc/core/helper/app_regex.dart';
import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/widgets/app_text_form_field.dart';
import 'package:docdoc/features/login/ui/widgets/password_validations.dart';
import 'package:docdoc/features/signup/logic/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool hasLowercase = false;

  bool hasUppercase = false;

  bool hasNumber = false;

  bool hasSpecialCharacters = false;

  bool hasMinLength = false;

  bool isObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<RegisterCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowercase(passwordController.text);
        hasUppercase = AppRegex.hasUppercase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacters(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<RegisterCubit>().formKey,
        child: Column(children: [
          AppTextFormField(
              hintText: "Name",
              validator: (value) {
                // ignore: unnecessary_null_comparison
                if (value == null || value.isEmpty) {
                  return "Please enter a valid name";
                }
              },
              controller: context.read<RegisterCubit>().nameController),
          verticalSpace(18),
          AppTextFormField(
            hintText: "Phone",
            validator: (value) {
              // ignore: unnecessary_null_comparison
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneValid(value)) {
                return "Please enter a valid phone number";
              }
            },
            controller: context.read<RegisterCubit>().phoneController,
          ),
          verticalSpace(18),
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
              controller: context.read<RegisterCubit>().emailController),
          verticalSpace(18),
          AppTextFormField(
              hintText: "Password",
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
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.hasMinLength(value)) {
                  return "Please enter a valid password";
                }
              },
              controller: context.read<RegisterCubit>().passwordController),
          verticalSpace(18),
          AppTextFormField(
              hintText: "Confirm Password",
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
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.hasMinLength(value)) {
                  return "Please enter a valid password";
                }
              },
              controller:
                  context.read<RegisterCubit>().confirmPasswordController),
          verticalSpace(24),
          PasswordValidations(
            haseLowerCase: hasLowercase,
            haseUpperCase: hasUppercase,
            haseNumber: hasNumber,
            haseSpecialCharacters: hasSpecialCharacters,
            haseMinLength: hasMinLength,
          ),
        ]));
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
