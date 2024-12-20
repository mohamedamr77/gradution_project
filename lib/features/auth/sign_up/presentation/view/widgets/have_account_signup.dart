import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/login_screen.dart';

import '../../../../../../core/utils/app_text.dart';
import '../../../../shared_widget_auth/have_or_not_account_auth.dart';

class HaveAccountSignup extends StatelessWidget {
  const HaveAccountSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return  HaveOrNotAccountAuth(
      titleOnTap: AppText.login,
      titleWithoutTap: AppText.alreadyHaveAccount,
      onTap: () {
        NavigationManager.push(LoginScreen.id);
      },
    );
  }
}
