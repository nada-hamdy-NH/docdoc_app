import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class DoctorListViewItem extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  final int index;
  const DoctorListViewItem(
      {super.key, required this.doctorsList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CachedNetworkImage(
        imageUrl:
            "https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050",
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Shimmer.fromColors(
            baseColor: ColorsManager.lightGray,
            highlightColor: Colors.white,
            child: Container(
              width: 110.w,
              height: 120.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
            ),
          );
        },
        imageBuilder: (context, imageProvider) => Container(
          width: 110.w,
          height: 120.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            doctorsList![index]!.name!,
            style: TextStyles.font18darkBlueSemiBold,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text("${doctorsList![index]!.degree} | ${doctorsList![index]!.phone}",
              style: TextStyles.font12GrayMedium),
          SizedBox(
            height: 8.h,
          ),
          Text(
            doctorsList![index]!.email!,
            style: TextStyles.font12GrayMedium,
          )
        ]),
      )
    ]);
  }
}
