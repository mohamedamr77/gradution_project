import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/custom_row_buttons.dart';
import 'package:gradutionproject/core/utils/bottomSheet_helper.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/locale_keys.g.dart';
import '../../../language_app/presentation/view/language_screen.dart';
import '../../../my_children/presentation/view/my_children_screen.dart';
import '../../../profile_setting/presentation/view/profile_setting_screen.dart';
import '../../../theme_app/presentation/view/theme_screen.dart';
import 'account_list_tile_model.dart';

List<AccountListTileModel> accountListTilesList = [
  AccountListTileModel(
    title: LocaleKeys.accountSettings.tr(),
    imageLeadingPath: AppIcons.settingsIcon,
    onTap: () {
      NavigationManager.push(ProfileSettingScreen.id);
    },
  ),
  AccountListTileModel(
    title: LocaleKeys.themes.tr(),
    imageLeadingPath: AppIcons.themeIcon,
    onTap: () {
      NavigationManager.push(ThemeScreen.id);
    },
  ),
  AccountListTileModel(
    title: LocaleKeys.notifications.tr(),
    imageLeadingPath: AppIcons.notificationIcon,
    onTap: () {
      BottomSheetHelper.customShowModelSheet(
          title: LocaleKeys.deleteAllNotifications.tr(),
          subTitle: LocaleKeys.deleteAllNotificationsConfirmation.tr(),
          button: CustomRowButtons(
            titleBlueButton: LocaleKeys.delete.tr(),
            onTapBlueButton: () {},
            titleWhiteButton: LocaleKeys.cancel.tr(),
            onTapWhiteButton: () {},
          ));
    },
  ),
  AccountListTileModel(
    title: LocaleKeys.language.tr(),
    imageLeadingPath: AppIcons.languageIcon,
    onTap: () {
      NavigationManager.push(LanguageScreen.id);
    },
  ),
  AccountListTileModel(
    title: LocaleKeys.addChild.tr(),
    imageLeadingPath: AppIcons.addChilderIcon,
    onTap: () {},
  ),
  AccountListTileModel(
    title: LocaleKeys.myChildren.tr(),
    imageLeadingPath: AppIcons.accountIcon,
    onTap: () {
      NavigationManager.push(MyChildrenScreen.id);
    },
  ),
  AccountListTileModel(
      title: LocaleKeys.logout.tr(),
      imageLeadingPath: AppIcons.logoutIcon,
      onTap: () {
        BottomSheetHelper.customShowModelSheet(
            title: LocaleKeys.logout.tr(),
            subTitle: LocaleKeys.logoutConfirmation.tr(),
            button: CustomRowButtons(
              titleBlueButton: LocaleKeys.logout.tr(),
              onTapBlueButton: () {},
              titleWhiteButton: LocaleKeys.cancel.tr(),
              onTapWhiteButton: () {},
            ));
      })
];
