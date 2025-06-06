import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/features/auth/shared_widget_auth/social_auth_section.dart';
import '../../../../../../core/shared_widget/name_screen.dart';
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
    var formKey = GlobalKey<FormState>();
    AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
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
                    const NameScreen(
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
                    CreateAccountButton(
                      formKey: formKey,
                    ),
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
      ),
    );
  }
}
