import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorListViewItem extends StatefulWidget {
  final List<Doctors?>? doctorsList;
  final int index;

  const DoctorListViewItem({
    super.key,
    required this.doctorsList,
    required this.index,
  });

  @override
  State<DoctorListViewItem> createState() => _DoctorListViewItemState();
}

class _DoctorListViewItemState extends State<DoctorListViewItem> {
  bool _showImage = false;

  List<String> images = [
    "assets/images/doctor1.png",
    "assets/images/doctor2.png",
    "assets/images/doctor3.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor1.png",
    "assets/images/doctor2.png",
    "assets/images/doctor3.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor1.png",
    "assets/images/doctor2.png",
    "assets/images/doctor3.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor1.png",
    "assets/images/doctor2.png",
    "assets/images/doctor3.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor1.png",
    "assets/images/doctor2.png",
    "assets/images/doctor3.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor1.png",
    "assets/images/doctor2.png",
    "assets/images/doctor3.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
    "assets/images/doctor4.png",
  ];

  @override
  void initState() {
    super.initState();
    // نخلي الـ shimmer يظهر شوية وبعدها تتبدل بالصورة
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showImage = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final doctor = widget.doctorsList![widget.index];
    final imagePath = images[widget.index % images.length];

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.doctorDetailsScreen,
            arguments: [doctor.id.toString(), images[widget.index]]);
      },
      child: Row(
        children: [
          // shimmer او الصورة حسب الحالة
          _showImage
              ? Container(
                  width: 110.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Shimmer.fromColors(
                  baseColor: ColorsManager.lightGray,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 110.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                    ),
                  ),
                ),

          // البيانات النصية
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor!.name!,
                  style: TextStyles.font18darkBlueSemiBold,
                ),
                SizedBox(height: 8.h),
                Text(
                  "${doctor.degree} | ${doctor.phone}",
                  style: TextStyles.font12GrayMedium,
                ),
                SizedBox(height: 8.h),
                Text(
                  doctor.email!,
                  style: TextStyles.font12GrayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
