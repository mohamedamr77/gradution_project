import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/shared_widget/custom_text_form_field.dart';
import 'package:gradutionproject/core/shared_widget/name_screen.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/verify_code_screen.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/image_forget_password.dart';

import '../../../../../core/utils/app_icons.dart';

class ForgetPassBody extends StatelessWidget {
  const ForgetPassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child:  Center(
              child: Column(
                children: [
                 const Spacer(),
                  const NameScreen(title: AppText.forgotPassword),
                  const Spacer(),
                   const ImageForgetPassword(imagePath: AppImages.forgetPasswordScreen),
                  const Spacer(),
                  const CustomTextField(
                    hintText: AppText.enterPhoneNumber,
                    prefix: AppIcons.phoneIcon,
                    title: AppText.phoneNumber,
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                      onPress: () {
                        NavigationManager.push(VerifyCodeScreen.id);
                      },
                      btnColor: AppColors.primaryColor,
                      titleButton: AppText.next,
                  ),
                  const Spacer(flex: 3,)
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}