import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/features/profile_setting/presentation/view/widgets/profile_setting_body.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/locale_keys.g.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';

class ProfileSettingScreen extends StatelessWidget {
  static String id = "profile_setting_screen";
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconArrowColor: AppColors.thirdColor,
        title: LocaleKeys.accountSettings.tr(),
      ),
      body: const ProfileSettingBody(),
    );
  }
}
