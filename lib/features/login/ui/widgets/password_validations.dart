import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool haseLowerCase;
  final bool haseUpperCase;
  final bool haseNumber;
  final bool haseSpecialCharacters;
  final bool haseMinLength;
  const PasswordValidations(
      {super.key,
      required this.haseLowerCase,
      required this.haseUpperCase,
      required this.haseNumber,
      required this.haseSpecialCharacters,
      required this.haseMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      buildValidationRow("At least 1 lowercase letter", haseLowerCase),
      verticalSpace(2),

      buildValidationRow("At least 1 uppercase letter", haseUpperCase),
      verticalSpace(2),

      buildValidationRow("At least 1 specialCharacter ", haseSpecialCharacters),
      verticalSpace(2),

      buildValidationRow("At least 1 number", haseNumber),
      verticalSpace(2),

      buildValidationRow("At least 8 characters long", haseMinLength),
    ]);
  }

  Widget buildValidationRow(String text, bool haseValidated) {
    return Row(children: [
      CircleAvatar(
        radius: 2.5.r,
        backgroundColor: ColorsManager.gray,
      ),
      horizontalSpace(6),
      Text(text, style: TextStyles.font13DarkBlueRegular.copyWith(
        decoration: haseValidated ? TextDecoration.lineThrough : null , 
        decorationColor: Colors.green , 
        decorationThickness: 2 , 
        color: haseValidated? ColorsManager.gray :ColorsManager.darkBlue 
      )),
    ]);
  }
}
    