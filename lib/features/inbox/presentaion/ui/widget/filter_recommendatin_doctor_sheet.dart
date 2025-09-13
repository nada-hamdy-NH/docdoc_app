import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/ui/logic/home_cubit.dart';
import 'package:docdoc/features/home/ui/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterRecommendationDoctorsSheet extends StatefulWidget {
  const FilterRecommendationDoctorsSheet({super.key});

  @override
  State<FilterRecommendationDoctorsSheet> createState() =>
      _FilterRecommendationDoctorsSheetState();
}

class _FilterRecommendationDoctorsSheetState
    extends State<FilterRecommendationDoctorsSheet> {
  int _selectedSpecialityIndex = -1;
  int _selectedRatingIndex = -1;

  void _selectSpeciality(int index) {
    setState(() {
      _selectedSpecialityIndex = index;
    });
  }

  void _selectRating(int index) {
    setState(() {
      _selectedRatingIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (p, c) =>
          p.docsStatus != c.docsStatus || p.doctors != c.doctors,
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsetsDirectional.only(start: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 24),
                  child: Align(
                    child: Text(
                      'Sort By',
                      style: TextStyles.font18Black600Weight.copyWith(
                        color: ColorsManager.darkBlue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Divider(
                  color: ColorsManager.LighterGray,
                  thickness: 1.0,
                  endIndent: 24,
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Speciality',
                  style: TextStyles.font16darkBlueMedium,
                ),
                const SizedBox(height: 24.0),
                if (state.docsStatus == LoadStatus.success)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    child: Row(
                      children: List.generate(
                        state.specializations!.length,
                        (index) {
                          final isSelected = index == _selectedSpecialityIndex;
                          return GestureDetector(
                            onTap: () => _selectSpeciality(index),
                            child: Container(
                              constraints: const BoxConstraints(minHeight: 41),
                              margin:
                                  const EdgeInsetsDirectional.only(end: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.0),
                                color: isSelected
                                    ? ColorsManager.mainBlue
                                    : Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 24,
                                  vertical: 10,
                                ),
                                child: Center(
                                  child: Text(
                                    state.specializations![index]!.name!,
                                    style:
                                        TextStyles.font14GrayRegular.copyWith(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (state.docsStatus == LoadStatus.loading)
                  CircularProgressIndicator(
                    color: ColorsManager.mainBlue,
                  ),
                const SizedBox(height: 24.0),
                Text(
                  'Rating',
                  style: TextStyles.font16darkBlueMedium,
                ),
                const SizedBox(height: 24.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    children: List.generate(
                      5,
                      (index) {
                        final isSelected = index == _selectedRatingIndex;
                        return GestureDetector(
                          onTap: () => _selectRating(index),
                          child: Container(
                            constraints: const BoxConstraints(minHeight: 41),
                            margin: const EdgeInsetsDirectional.only(end: 12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: isSelected
                                  ? ColorsManager.mainBlue
                                  : Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_rate_rounded,
                                      color: isSelected
                                          ? Colors.white
                                          : const Color(0xffE0E0E0),
                                    ),
                                    const SizedBox(width: 6.0),
                                    Text(
                                      "${5 - index}",
                                      style:
                                          TextStyles.font14GrayRegular.copyWith(
                                        color: isSelected
                                            ? Colors.white
                                            : const Color(0xffE0E0E0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 48.0),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 24),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ColorsManager.mainBlue,
                      minimumSize: const Size(double.infinity, 52.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: Text(
                      "Done",
                      style: TextStyles.font16WhiteSemiBold,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
