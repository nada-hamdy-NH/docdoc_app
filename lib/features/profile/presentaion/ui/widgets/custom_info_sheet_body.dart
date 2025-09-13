import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/profile/data/model/profile_model/profile_model.dart';
import 'package:docdoc/features/profile/presentaion/ui/widgets/custom_container_item.dart';
import 'package:docdoc/features/profile/presentaion/ui/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';

class CustomInfoSheetBody extends StatelessWidget {
  const CustomInfoSheetBody({
    super.key,
    required this.profile,
  });

  final ProfileModel? profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 75),
        if (profile != null) ...[
          Text(
            profile!.data![0].name ?? "",
            style: TextStyles.font18Black600Weight,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            profile!.data![0].email ?? "",
            style: TextStyles.font14GrayRegular,
            textAlign: TextAlign.center,
          ),
        ] else ...[
          Text(
            "No Profile Data Available",
            style: TextStyles.font18Black600Weight,
            textAlign: TextAlign.center,
          ),
        ],
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomContainerItem(
              onTap: () {},
              title: "My Appointment",
              borderRadius: const BorderRadiusDirectional.only(
                bottomStart: Radius.circular(16),
                topStart: Radius.circular(16),
              ),
            ),
            const SizedBox(width: 1),
            CustomContainerItem(
              onTap: () {},
              title: "Medical records",
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(16),
                topEnd: Radius.circular(16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        ProfileListTile(
          onTap: () {},
          title: "Personal Information",
          image: "assets/svgs/personalcard.svg",
          backgroundColor: ColorsManager.liteBlue,
        ),
        ProfileListTile(
          onTap: () {},
          title: "My Test & Diagnostic",
          image: "assets/svgs/directbox.svg",
          backgroundColor: ColorsManager.liteGreen,
        ),
        ProfileListTile(
          onTap: () {},
          title: "Payment",
          image: "assets/svgs/wallet.svg",
          backgroundColor: ColorsManager.literRed,
          colorFilter: const ColorFilter.mode(
            ColorsManager.mainBlue,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}
