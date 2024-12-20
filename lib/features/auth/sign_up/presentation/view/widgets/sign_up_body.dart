import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/view/widgets/social_auth_section.dart';
import '../../../../shared_widget_auth/name_screen_auth.dart';
import 'confirm_pass_field_sign_up.dart';
import 'create_account_button.dart';
import 'email_field_sign_up.dart';
import 'name_field_sign_up.dart';
import 'password_field_sign_up.dart';
import 'phone_filed_sign_up.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Center(
        child:CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  NameScreenAuth(title:AppText.createNewAccount,),
                  SizedBox(
                    height: 32,
                  ),
                  NameFieldSignUp(),
                  SizedBox(
                    height: 16,
                  ),
                  PhoneFiledSignUp(),
                  SizedBox(
                    height: 16,
                  ),
                  EmailFieldSignUp(),
                  SizedBox(
                    height: 16,
                  ),
                  PasswordFieldSignUp(),
                  SizedBox(
                    height: 16,
                  ),
                  ConfirmPassFieldSignUp(),
                  SizedBox(height: 32,),
                  CreateAccountButton(),
                  SocialAuthSection(),
                  SizedBox(height: 16,),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GText(color: AppColors.primaryColor, content: AppText.alreadyHaveAccount, fontSize: 16 , fontWeight: FontWeight.w500,),
                      SizedBox(width: 10,),
                      GText(color: AppColors.primaryColor, content: AppText.login, fontSize: 16 , fontWeight: FontWeight.w900,)
                    ],
                  ),
                  SizedBox(height: 16,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
