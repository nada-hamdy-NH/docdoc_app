import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar(
  context, {
  required String title,
  Widget? trailing,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    leadingWidth: 60,
    leading: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
        margin: const EdgeInsetsDirectional.only(start: 16, top: 5, bottom: 5),
        padding: const EdgeInsetsDirectional.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: Colors.white,
          border: Border.all(
            color: ColorsManager.LighterGray,
            width: 1,
          ),
        ),
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          color: ColorsManager.darkBlue,
        ),
      ),
    ),
    title: Text(title, style: TextStyles.font18darkBlueSemiBold),
    actions: [
      if (trailing != null) trailing,
    ],
  );
}
