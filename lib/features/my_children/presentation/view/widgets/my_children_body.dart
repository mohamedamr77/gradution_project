import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/shared_widget/custom_child_tile.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import '../../../../../core/utils/app_text.dart';

class MyChildrenBody extends StatelessWidget {
  const MyChildrenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          CustomChildTile(
            imagePath: AppImages.childTest,
            title: AppText.childName,
            subTitle: AppText.yearAndFourMonth,
            leading: SvgPicture.asset(AppIcons.pencilSquare),
          )
        ],
      ),
    );
  }
}
