import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/toast_utils.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/utils/token_manager.dart';
import 'package:gradutionproject/core/utils/user_id_managar.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/login_screen.dart';
import 'package:gradutionproject/features/profile_setting/presentation/view/widgets/field_name_profile_setting.dart';
import 'package:gradutionproject/features/profile_setting/presentation/view/widgets/field_phone_profile_setting.dart';
import 'package:gradutionproject/features/profile_setting/presentation/view/widgets/setting_header_section.dart';
import 'package:gradutionproject/features/profile_setting/presentation/view_model/profile_setting_state.dart';

import '../../../../../core/shared_widget/custom_row_buttons.dart';
import '../../../../../core/utils/bottomSheet_helper.dart';
import '../../view_model/profile_setting_cubit.dart';
import 'field_email_profile_setting.dart';
import 'field_password_profile_setting.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/utils/locale_keys.g.dart';

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
          _buildButtons(context: context),
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

  SliverToBoxAdapter _buildButtons({required BuildContext context}) {
    return SliverToBoxAdapter(
      child: BlocConsumer<ProfileSettingCubit, ProfileSettingState>(
        listener: (context, state) {
          if (state is ProfileSettingSuccess) {
            TokenManager.clearToken();
            NavigationManager.replaceAll(LoginScreen.id);
          } else if (state is ProfileSettingError) {
            ToastUtils.showToast(message: state.error);
          }
        },
        builder: (context, state) {
          return
          state is ProfileSettingLoading
              ? const Center(child: CircularProgressIndicator())
              :
            CustomRowButtons(
            titleBlueButton: LocaleKeys.editAccount.tr(),
            onTapBlueButton: () {},
            titleWhiteButton: LocaleKeys.deleteAccount.tr(),
            onTapWhiteButton: () {
              BottomSheetHelper.customShowModelSheet(
                  title: LocaleKeys.deleteAccount.tr(),
                  subTitle: LocaleKeys.deleteAccountConfirmation.tr(),
                  button: CustomRowButtons(
                    titleBlueButton: LocaleKeys.delete.tr(),
                    onTapBlueButton: () {
                      NavigationManager.goBack();
                      BlocProvider.of<ProfileSettingCubit>(context)
                          .deleteAccount(userId: UserIdManager.getToken() ??"");
                    },
                    titleWhiteButton: LocaleKeys.cancel.tr(),
                    onTapWhiteButton: () {},
                  ));
            },
          );
        },
      ),
    );
  }
}
