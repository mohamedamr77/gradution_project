import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/shared_widget/custom_text_form_field.dart';
import 'package:gradutionproject/core/shared_widget/name_screen.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_icons.dart';

class ForgetPassBody extends StatelessWidget {
  const ForgetPassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const NameScreen(title: AppText.forgotPassword),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              AppImages.forgetPasswordScreen,
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 0.33.h,
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomTextField(
              hintText: AppText.enterPhoneNumber,
              prefix: AppIcons.phoneIcon,
              title: AppText.phoneNumber,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomElevatedButton(
                onPress: () {},
                child: const GText(
                    color: AppColors.lightGrayColor,
                    content: AppText.next,
                    fontSize: 16
                ),
                btnColor: AppColors.primaryColor)
          ],
        ),
      ),
    );
  }
}
