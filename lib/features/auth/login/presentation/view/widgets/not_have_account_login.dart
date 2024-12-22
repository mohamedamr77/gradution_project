import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';

import '../../../../../../core/utils/app_text.dart';
import '../../../../../../core/shared_widget/text_with_action_row .dart';

class NotHaveAccountLogin extends StatelessWidget {
  const NotHaveAccountLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TextWithActionRow (
        titleOnTap: AppText.createAccount,
        titleWithoutTap: AppText.noAccountYet,
        onTap: () {
          NavigationManager.goBack();
        });
  }
}
