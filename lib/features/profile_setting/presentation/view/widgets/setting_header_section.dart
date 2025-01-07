import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';

class ProfileSettingHeaderSection extends StatelessWidget {
  final String image;
  const ProfileSettingHeaderSection({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          _buildImageWithIcon(),
          _buildSpacer(height: 8),
          _buildNameText(name: "ملك عمرو",),
        ],
      ),
    );
  }
  Widget _buildImageWithIcon(){
    return  Align(
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
    );
  }
  
  Widget _buildSpacer({required double height}){
    return SizedBox(height: height,);
  }
  
  Widget _buildNameText({required String name}){
    return GText(color: AppColors.darkCharcoalColor, content: name, fontSize: 18);
  }
}
