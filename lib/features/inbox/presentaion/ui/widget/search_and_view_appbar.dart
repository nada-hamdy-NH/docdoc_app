import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/features/home/ui/logic/home_cubit.dart';
import 'package:docdoc/features/inbox/presentaion/ui/widget/filter_recommendatin_doctor_sheet.dart';
import 'package:docdoc/features/inbox/presentaion/ui/widget/recommendation_doctor_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar(
      {super.key, this.onTap, this.onChanged, this.controller});
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RecommendationDoctorSearch(
            onChanged: onChanged,
            controller: controller,
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: onTap,
          child: const Icon(
            Icons.filter_list_rounded,
            color: ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}

void openModalSheet(BuildContext context) {
  var getAllSpecialities = context.read<HomeCubit>();
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30.0),
      ),
    ),
    builder: (context) {
      return BlocProvider.value(
        value: getAllSpecialities,
        child: const FilterRecommendationDoctorsSheet(),
      );
    },
  );
}
