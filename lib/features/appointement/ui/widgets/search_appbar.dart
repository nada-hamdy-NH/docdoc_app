import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTrailingAppBar extends StatelessWidget {
  const SearchTrailingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
      margin: const EdgeInsetsDirectional.only(top: 5, bottom: 5, end: 16),
      padding: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        color: Colors.white,
        border: Border.all(
          color: ColorsManager.LighterGray,
        ),
      ),
      child: SvgPicture.asset(
        "assets/svgs/nav_search.svg",
        colorFilter: const ColorFilter.mode(
          ColorsManager.darkBlue,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
