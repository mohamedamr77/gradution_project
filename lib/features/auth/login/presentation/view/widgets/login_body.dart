import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/widgets/password_field_login.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/widgets/social_auth_login.dart';
import '../../../../../../core/utils/app_text.dart';
import '../../../../../../core/shared_widget/name_screen.dart';
import 'email_field_login.dart';
import 'forget_password_login.dart';
import 'login_button.dart';
import 'not_have_account_login.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Center(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const NameScreenAuth(
                    title: AppText.login,
                  ),
                  SizedBox(
                    height: 0.1.h,
                  ),
                  const EmailFieldLogin(),
                  const SizedBox(
                    height: 16,
                  ),
                  const PasswordFieldLogin(),
                  const SizedBox(
                    height: 8,
                  ),
                  const ForgetPasswordLogin(),
                  SizedBox(
                    height: 0.05.h,
                  ),
                  const LoginButton(),
                  const SizedBox(
                    height: 16,
                  ),
                  const SocialAuthLogin(),
                  SizedBox(
                    height: 0.04.h,
                  ),
                  const NotHaveAccountLogin(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
