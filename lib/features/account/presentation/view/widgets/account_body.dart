import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../../../../core/shared_widget/custom_list_tile.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_images.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: CustomScrollView(
        slivers: [
          _buildSpacer(height: 16),
          _buildNameScreen(title: AppText.profile),
          _buildSpacer(height: 16),
          _buildImageUser(imagePath: AppImages.lailaTest),
          _buildSpacer(height: 16),
          _buildListTile(),

        ],
      ),
    );
  }

  SliverToBoxAdapter _buildSpacer({required double height}) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }
  SliverToBoxAdapter _buildNameScreen({required String title}){
    return SliverToBoxAdapter(
      child: Align(
          alignment: Alignment.center,
          child: GText(color: AppColors.primaryColor, content: title, fontSize: 18)),
    );
  }
  SliverToBoxAdapter _buildImageUser({required String imagePath}){
    return SliverToBoxAdapter(
      child: Align(
          alignment: Alignment.center,
          child: CircleAvatar(
        radius: 0.18.w,
        child: Image.asset(imagePath),
    ),
      ));
  }

  SliverToBoxAdapter _buildListTile(){
    return  SliverToBoxAdapter(
      child: CustomListTile(
        title: 'اعدادات الحساب الشخصى',
        onTap: () {  },
        leading:SvgPicture.asset(AppIcons.accountIcon),),
    );
  }
}
