import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/profile_setting/presentation/view/widgets/field_name_profile_setting.dart';
import 'package:gradutionproject/features/profile_setting/presentation/view/widgets/field_phone_profile_setting.dart';
import 'package:gradutionproject/features/profile_setting/presentation/view/widgets/setting_header_section.dart';

import '../../../../../core/shared_widget/custom_row_buttons.dart';
import '../../../../../core/utils/bottomSheet_helper.dart';
import 'field_email_profile_setting.dart';
import 'field_password_profile_setting.dart';

class ProfileSettingBody extends StatelessWidget {
  const ProfileSettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          const ProfileSettingHeaderSection(image: AppImages.lailaTest),
          _buildSpacer(height: 24),
          const SliverToBoxAdapter(
            child: FieldNameProfileSetting(),
          ),
          _buildSpacer(height: 16),
          const SliverToBoxAdapter(
            child: FieldEmailProfileSetting(),
          ),
          _buildSpacer(height: 16),
          const SliverToBoxAdapter(
            child: FieldPhoneProfileSetting(),
          ),
          _buildSpacer(height: 16),
          const SliverToBoxAdapter(
            child: FieldPasswordProfileSetting(),
          ),
          _buildSpacer(height: 32),
          _buildButtons(),
          _buildSpacer(height: 24),
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

  SliverToBoxAdapter _buildButtons() {
    return SliverToBoxAdapter(
      child: CustomRowButtons(
        titleBlueButton: AppText.editAccount,
        onTapBlueButton: () {},
        titleWhiteButton: AppText.deleteAccount,
        onTapWhiteButton: () {
          BottomSheetHelper.customShowModelSheet(
              title: AppText.deleteAccount,
              subTitle: AppText.deleteAccountConfirmation,
              button: CustomRowButtons(
                titleBlueButton: AppText.delete,
                onTapBlueButton: () {},
                titleWhiteButton: AppText.cancel,
                onTapWhiteButton: () {},
              ));
        },
      ),
    );
  }
}
