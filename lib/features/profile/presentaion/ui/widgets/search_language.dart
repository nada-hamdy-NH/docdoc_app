import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchForLanguageTextField extends StatelessWidget {
  const SearchForLanguageTextField({super.key, this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorsManager.mainBlue,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        hintText: 'Search',
        hintStyle: TextStyles.font12Bluemeduim.copyWith(
          color: ColorsManager.darkBlue,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            "assets/svgs/search.svg",
            colorFilter: const ColorFilter.mode(
              ColorsManager.darkBlue,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
