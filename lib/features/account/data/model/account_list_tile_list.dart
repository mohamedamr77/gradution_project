import 'package:easy_localization/easy_localization.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/custom_row_buttons.dart';
import 'package:gradutionproject/core/utils/bottomSheet_helper.dart';
import 'package:gradutionproject/core/utils/token_manager.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/login_screen.dart';
import 'package:gradutionproject/features/child_information/presentation/view/child_info_screen.dart';
import 'package:gradutionproject/features/notification_feature/presentation/view/noificaion_screen.dart';

import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/locale_keys.g.dart';
import '../../../language_app/presentation/view/language_screen.dart';
import '../../../my_children/presentation/view/my_children_screen.dart';
import '../../../profile_setting/presentation/view/profile_setting_screen.dart';

import 'account_list_tile_model.dart';

List<AccountListTileModel> accountListTilesList = [
  AccountListTileModel(
    title: LocaleKeys.accountSettings,
    imageLeadingPath: AppIcons.settingsIcon,
    onTap: () {
      NavigationManager.push(ProfileSettingScreen.id);
    },
  ),
  // AccountListTileModel(
  //   title: LocaleKeys.themes,
  //   imageLeadingPath: AppIcons.themeIcon,
  //   onTap: () {
  //     NavigationManager.push(ThemeScreen.id);
  //   },
  // ),
  AccountListTileModel(
    title: LocaleKeys.notifications,
    imageLeadingPath: AppIcons.notificationIcon,
    onTap: () {
       NavigationManager.push(NotificationScreen.id);
    },
  ),
  AccountListTileModel(
    title: LocaleKeys.language,
    imageLeadingPath: AppIcons.languageIcon,
    onTap: () {
      NavigationManager.push(LanguageScreen.id);
    },
  ),
  AccountListTileModel(
    title: LocaleKeys.addChild,
    imageLeadingPath: AppIcons.addChilderIcon,
    onTap: () {
      NavigationManager.push(ChildInfoScreen.id);
      },
  ),
  AccountListTileModel(
    title: LocaleKeys.myChildren,
    imageLeadingPath: AppIcons.accountIcon,
    onTap: () {
      NavigationManager.push(MyChildrenScreen.id);
    },
  ),
  AccountListTileModel(
      title: LocaleKeys.logout,
      imageLeadingPath: AppIcons.logoutIcon,
      onTap: () {
        BottomSheetHelper.customShowModelSheet(
            title: LocaleKeys.logout.tr(),
            subTitle: LocaleKeys.logoutConfirmation.tr(),
            button: CustomRowButtons(
              titleBlueButton: LocaleKeys.logout.tr(),
              onTapBlueButton: () {
                TokenManager.clearToken();
                NavigationManager.replaceAll(LoginScreen.id);
              },
              titleWhiteButton: LocaleKeys.cancel.tr(),
              onTapWhiteButton: () {
                NavigationManager.goBack();
              },
            ));
      })
];
