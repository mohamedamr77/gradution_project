import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/widgets/password_field_login.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/widgets/river_image_login.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/widgets/social_auth_login.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/utils/locale_keys.g.dart';
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
                  NameScreen(
                    title: LocaleKeys.login.tr(),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const RiverImageLogin(),
                  const SizedBox(
                    height: 20,
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
