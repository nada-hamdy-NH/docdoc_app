import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarIcons extends StatefulWidget {
  PageController pageController;
  BottomBarIcons({super.key, required this.pageController});

  @override
  State<BottomBarIcons> createState() => _BottomBarIconsState();
}

class _BottomBarIconsState extends State<BottomBarIcons> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 25.0, right: 25.0, top: .0, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () => widget.pageController.jumpToPage(0),
                  child: SvgPicture.asset(
                    "assets/svgs/home-2.svg",
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.cover,
                  )),
              InkWell(
                onTap: () => widget.pageController.jumpToPage(1),
                child: Stack(
                  children: [
                    widget.pageController.page == 1
                        ? SvgPicture.asset(
                            "assets/svgs/message-text-active.svg")
                        : SvgPicture.asset("assets/svgs/message-text.svg"),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: SvgPicture.asset("assets/svgs/dot.svg",
                          width: 8.w, height: 8.h),
                    )
                  ],
                ),
              ),
              SizedBox.shrink(),
              InkWell(
                  onTap: () {
                    widget.pageController.jumpToPage(3);
                  },
                  child: widget.pageController.page == 3
                      ? SvgPicture.asset(
                          "assets/svgs/calendar-active.svg",
                          width: 24.w,
                          height: 24.h,
                          fit: BoxFit.cover,
                        )
                      : SvgPicture.asset(
                          "assets/svgs/calendar-2.svg",
                          width: 24.w,
                          height: 24.h,
                          fit: BoxFit.cover,
                        )),
              InkWell(
                  onTap: () => widget.pageController.jumpToPage(4),
                  child: widget.pageController.page == 4
                      ? Image.asset(
                          "assets/images/profile-active.png",
                          width: 24.w,
                          height: 24.h,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assets/images/profile.png",
                          width: 24.w,
                          height: 24.h,
                          fit: BoxFit.cover,
                        )),
            ],
          ),
        ));
  }
}
