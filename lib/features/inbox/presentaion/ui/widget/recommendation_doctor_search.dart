import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecommendationDoctorSearch extends StatelessWidget {
  const RecommendationDoctorSearch({
    super.key,
    this.onChanged,
    this.controller,
  });
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: ColorsManager.mainBlue,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintText: 'Search',
        hintStyle: TextStyles.font12Bluemeduim.copyWith(
          color: Colors.black,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            'assets/svgs/search.svg',
            colorFilter: const ColorFilter.mode(
              Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
