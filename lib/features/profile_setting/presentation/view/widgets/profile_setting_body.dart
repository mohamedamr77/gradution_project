import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/profile_setting/presentation/view/widgets/setting_header_section.dart';

class ProfileSettingBody extends StatelessWidget {
  const ProfileSettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
       slivers: [
         const ProfileSettingHeaderSection(image: AppImages.lailaTest),
         _buildSpacer(height: 24),

       ],
    );
  }

  SliverToBoxAdapter _buildSpacer({required double height}) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }
}
