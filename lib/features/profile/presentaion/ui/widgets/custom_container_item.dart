import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class CustomContainerItem extends StatelessWidget {
  const CustomContainerItem({
    super.key,
    this.onTap,
    this.borderRadius,
    required this.title,
  });
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 34, vertical: 20),
          decoration: BoxDecoration(
            color: ColorsManager.gray,
            borderRadius: borderRadius,
          ),
          child: Text(
            title,
            style: TextStyles.font12GrayRegular.copyWith(
              color: ColorsManager.darkBlue,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
