import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/features/auth/shared_widget_auth/social_auth_section.dart';
import '../../../../shared_widget_auth/have_or_not_account_auth.dart';
import '../../../../shared_widget_auth/name_screen_auth.dart';
import 'confirm_pass_field_sign_up.dart';
import 'create_account_button.dart';
import 'email_field_sign_up.dart';
import 'have_account_signup.dart';
import 'name_field_sign_up.dart';
import 'password_field_sign_up.dart';
import 'phone_filed_sign_up.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                    title: AppText.createNewAccount,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const NameFieldSignUp(),
                  const SizedBox(
                    height: 16,
                  ),
                  const PhoneFiledSignUp(),
                  const SizedBox(
                    height: 16,
                  ),
                  const EmailFieldSignUp(),
                  const SizedBox(
                    height: 16,
                  ),
                  const PasswordFieldSignUp(),
                  const SizedBox(
                    height: 16,
                  ),
                  const ConfirmPassFieldSignUp(),
                  const SizedBox(
                    height: 32,
                  ),
                  const CreateAccountButton(),
                  SocialAuthSection(
                    onTapFaceBooK: () {},
                    onTapGoogle: () {},
                    onTapApple: () {},
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const HaveAccountSignup(),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
