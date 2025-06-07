import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/utils/locale_keys.g.dart';
import '../../../../../../core/shared_widget/text_with_action_row .dart';

class NotHaveAccountLogin extends StatelessWidget {
  const NotHaveAccountLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TextWithActionRow(
        titleOnTap: LocaleKeys.createAccount.tr(),
        titleWithoutTap: LocaleKeys.noAccountYet.tr(),
        onTap: () {
          NavigationManager.goBack();
        });
  }
}
