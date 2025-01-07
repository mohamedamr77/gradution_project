import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/features/profile_setting/presentation/view/widgets/profile_setting_body.dart';

import '../../../../core/navigation/navigation_manager.dart';
import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_text.dart';

class ProfileSettingScreen extends StatelessWidget {
  static String id = "profile_setting_screen";
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        iconArrowColor: AppColors.thirdColor ,
        title: AppText.accountSettings,
        onBackPressed: () {
          NavigationManager.goBack();
        },
      ),
      body: const ProfileSettingBody(),
    );
  }
}
