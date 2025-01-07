import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_text.dart';
import 'account_list_tile_model.dart';

List<AccountListTileModel> accountListTilesList= [
  AccountListTileModel(title: AppText.accountSettings, imageLeadingPath: AppIcons.settingsIcon, onTap: () {},),
  AccountListTileModel(title: AppText.themes, imageLeadingPath: AppIcons.themeIcon, onTap: () {},),
  AccountListTileModel(title: AppText.notifications, imageLeadingPath: AppIcons.notificationIcon, onTap: () {},),
  AccountListTileModel(title: AppText.language, imageLeadingPath: AppIcons.languageIcon, onTap: () {},),
  AccountListTileModel(title: AppText.addChild, imageLeadingPath: AppIcons.addChilderIcon, onTap: () {},),
  AccountListTileModel(title: AppText.myChildren, imageLeadingPath: AppIcons.accountIcon, onTap: () {},),
  AccountListTileModel(title: AppText.logout, imageLeadingPath: AppIcons.logoutIcon, onTap: () {},),
];