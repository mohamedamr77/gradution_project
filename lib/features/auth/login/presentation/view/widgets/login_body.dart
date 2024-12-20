import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/shared_widget/custom_text_form_field.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/auth/shared_widget_auth/have_or_not_account_auth.dart';
import 'package:gradutionproject/features/auth/shared_widget_auth/social_auth_section.dart';
import '../../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../../core/utils/app_text.dart';
import '../../../../shared_widget_auth/name_screen_auth.dart';

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
                  const CustomTextField(
                    title: AppText.emailAddress,
                    prefix: Icon(
                      Icons.email,
                      color: AppColors.thirdColor,
                    ),
                    hintText: AppText.enterEmailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    title: AppText.password,
                    hintText: AppText.enterPassword,
                    suffixIcon: const Icon(
                      Icons.visibility_off,
                      color: AppColors.thirdColor,
                    ),
                    prefix: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(AppIcons.passwordIcon)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                          onTap: () {},
                          child: const GText(
                              color: AppColors.thirdColor,
                              content: AppText.forgotPassword,
                              fontSize: 14))),
                  SizedBox(
                    height: 0.05.h,
                  ),
                  CustomElevatedButton(
                      borderRadius: 8,
                      onPress: () {},
                      btnColor: AppColors.primaryColor,
                      child: const GText(
                          color: AppColors.lightGrayColor,
                          content: AppText.login,
                          fontSize: 16)),
                  const SizedBox(
                    height: 16,
                  ),
                  SocialAuthSection(onTapFaceBooK: (){}, onTapGoogle: (){}, onTapApple: (){}),
                  SizedBox(
                    height: 0.04.h,
                  ),
                  HaveOrNotAccountAuth(titleOnTap: AppText.createAccount, titleWithoutTap: AppText.noAccountYet, onTap: (){})
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
