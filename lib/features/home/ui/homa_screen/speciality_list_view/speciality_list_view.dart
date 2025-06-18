import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:docdoc/features/home/logic/home_cubit.dart';
import 'package:docdoc/features/home/ui/homa_screen/speciality_list_view/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationData?> specializationDataLst;
  const SpecialityListView({super.key, required this.specializationDataLst});

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  int selectedSpecialityIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        width: double.infinity,
        height: 100.h,
        child: ListView.builder(
            itemCount: widget.specializationDataLst.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        setUpSpeialityClick(index, context);
                      },
                      child: SpecialityListViewItem(
                        specializationDataLst: widget.specializationDataLst,
                        itemIndex: index,
                        selectedIndex: selectedSpecialityIndex,
                      )),
                  SizedBox(
                    width: 31.w,
                  ),
                ],
              );
            }),
      ),
    );
  }

  setUpSpeialityClick(int index, BuildContext context) {
    setState(() {
      selectedSpecialityIndex = index;
    });
      context.read<HomeCubit>().getDoctors(
          specializationId: widget.specializationDataLst[index]!.id!);
  }
}
