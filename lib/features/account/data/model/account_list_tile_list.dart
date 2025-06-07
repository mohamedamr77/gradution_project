import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/custom_row_buttons.dart';
import 'package:gradutionproject/core/utils/bottomSheet_helper.dart';

import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/locale_keys.g.dart';
import '../../../language_app/presentation/view/language_screen.dart';
import '../../../my_children/presentation/view/my_children_screen.dart';
import '../../../profile_setting/presentation/view/profile_setting_screen.dart';
import '../../../theme_app/presentation/view/theme_screen.dart';
import 'account_list_tile_model.dart';

List<AccountListTileModel> accountListTilesList = [
  AccountListTileModel(
    title: LocaleKeys.accountSettings,
    imageLeadingPath: AppIcons.settingsIcon,
    onTap: () {
      NavigationManager.push(ProfileSettingScreen.id);
    },
  ),
  AccountListTileModel(
    title: LocaleKeys.themes,
    imageLeadingPath: AppIcons.themeIcon,
    onTap: () {
      NavigationManager.push(ThemeScreen.id);
    },
  ),
  AccountListTileModel(
    title: LocaleKeys.notifications,
    imageLeadingPath: AppIcons.notificationIcon,
    onTap: () {
      BottomSheetHelper.customShowModelSheet(
          title: LocaleKeys.deleteAllNotifications,
          subTitle: LocaleKeys.deleteAllNotificationsConfirmation,
          button: CustomRowButtons(
            titleBlueButton: LocaleKeys.delete,
            onTapBlueButton: () {},
            titleWhiteButton: LocaleKeys.cancel,
            onTapWhiteButton: () {},
          ));
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
    onTap: () {},
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
            title: LocaleKeys.logout,
            subTitle: LocaleKeys.logoutConfirmation,
            button: CustomRowButtons(
              titleBlueButton: LocaleKeys.logout,
              onTapBlueButton: () {},
              titleWhiteButton: LocaleKeys.cancel,
              onTapWhiteButton: () {},
            ));
      })
];
