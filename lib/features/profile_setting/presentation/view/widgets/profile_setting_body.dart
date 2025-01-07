import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

class ProfileSettingBody extends StatelessWidget {
  const ProfileSettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
       slivers: [
         _buildImageAndName(image: AppImages.lailaTest)
       ],
    );
  }

  SliverToBoxAdapter _buildImageAndName({required String image }){
    return SliverToBoxAdapter(
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 0.18.w,
                child: Image.asset(image),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.lightGrayColor,
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.primaryColor,
                  child: SvgPicture.asset(AppIcons.pinIcon),
                ),

              )
            ],

        ),
      )
    );
  }
}
