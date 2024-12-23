import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

class ImageChildSection extends StatelessWidget {
  const ImageChildSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 0.13.w,
          backgroundColor: AppColors.grayColor,
          child: AppIcons.cameraIcon,
        ),
        SizedBox(
          height: 0.02.h,
        ),
        const GText(
          color: AppColors.grayBlackColor,
          content: AppText.addChildPhoto,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
