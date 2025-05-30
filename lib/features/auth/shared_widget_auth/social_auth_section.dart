import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

class SocialAuthSection extends StatelessWidget {
  final void Function() onTapFaceBooK;
  final void Function() onTapGoogle;
  final void Function() onTapApple;
  const SocialAuthSection(
      {super.key,
      required this.onTapFaceBooK,
      required this.onTapGoogle,
      required this.onTapApple});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        const GText(
            color: AppColors.primaryColor,
            content: AppText.orRegisterUsing,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialContainerItem(
              onTap: onTapFaceBooK,
              iconPath: AppIcons.facebookIcon,
            ),
            const SizedBox(
              width: 16,
            ),
            SocialContainerItem(
              onTap: onTapApple,
              iconPath: AppIcons.appleIcon,
            ),
            const SizedBox(
              width: 16,
            ),
            SocialContainerItem(
              onTap: onTapGoogle,
              iconPath: AppImages.google,
            ),
          ],
        )
      ],
    );
  }
}

class SocialContainerItem extends StatelessWidget {
  final void Function() onTap;
  final String iconPath;
  const SocialContainerItem(
      {super.key, required this.onTap, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        width: 0.17.w,
        height: 0.07.h,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.thirdColor,
              width: 1,
            )),
        child: iconPath.contains("svg")
            ? SvgPicture.asset(iconPath)
            : Image.asset(iconPath),
      ),
    );
  }
}
