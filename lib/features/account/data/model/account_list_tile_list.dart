import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/custom_row_buttons.dart';
import 'package:gradutionproject/core/utils/bottomSheet_helper.dart';

import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_text.dart';
import '../../../language_app/presentation/view/language_screen.dart';
import '../../../my_children/presentation/view/my_children_screen.dart';
import '../../../profile_setting/presentation/view/profile_setting_screen.dart';
import '../../../theme_app/presentation/view/theme_screen.dart';
import 'account_list_tile_model.dart';

List<AccountListTileModel> accountListTilesList = [
  AccountListTileModel(
    title: AppText.accountSettings,
    imageLeadingPath: AppIcons.settingsIcon,
    onTap: () {
      NavigationManager.push(ProfileSettingScreen.id);
    },
  ),
  AccountListTileModel(
    title: AppText.themes,
    imageLeadingPath: AppIcons.themeIcon,
    onTap: () {
      NavigationManager.push(ThemeScreen.id);
    },
  ),
  AccountListTileModel(
    title: AppText.notifications,
    imageLeadingPath: AppIcons.notificationIcon,
    onTap: () {
      BottomSheetHelper.customShowModelSheet(
          title: AppText.deleteAllNotifications,
          subTitle: AppText.deleteAllNotificationsConfirmation,
          button: CustomRowButtons(
            titleBlueButton: AppText.delete,
            onTapBlueButton: () {},
            titleWhiteButton: AppText.cancel,
            onTapWhiteButton: () {},
          ));
    },
  ),
  AccountListTileModel(
    title: AppText.language,
    imageLeadingPath: AppIcons.languageIcon,
    onTap: () {
      NavigationManager.push(LanguageScreen.id);
    },
  ),
  AccountListTileModel(
    title: AppText.addChild,
    imageLeadingPath: AppIcons.addChilderIcon,
    onTap: () {},
  ),
  AccountListTileModel(
    title: AppText.myChildren,
    imageLeadingPath: AppIcons.accountIcon,
    onTap: () {
      NavigationManager.push(MyChildrenScreen.id);
    },
  ),
  AccountListTileModel(
      title: AppText.logout,
      imageLeadingPath: AppIcons.logoutIcon,
      onTap: () {
        BottomSheetHelper.customShowModelSheet(
            title: AppText.logout,
            subTitle: AppText.logoutConfirmation,
            button: CustomRowButtons(
              titleBlueButton: AppText.logout,
              onTapBlueButton: () {},
              titleWhiteButton: AppText.cancel,
              onTapWhiteButton: () {},
            ));
      })
];
