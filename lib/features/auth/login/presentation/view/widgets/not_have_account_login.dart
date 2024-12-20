import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_text.dart';
import '../../../../shared_widget_auth/have_or_not_account_auth.dart';

class NotHaveAccountLogin extends StatelessWidget {
  const NotHaveAccountLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return HaveOrNotAccountAuth(
        titleOnTap: AppText.createAccount,
        titleWithoutTap: AppText.noAccountYet,
        onTap: () {});
  }
}
