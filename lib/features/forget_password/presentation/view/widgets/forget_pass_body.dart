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
                  Image.asset(
                    AppImages.forgetPasswordScreen,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    height: 0.33.h,
                  ),
                  const Spacer(),
                  const CustomTextField(
                    hintText: AppText.enterPhoneNumber,
                    prefix: AppIcons.phoneIcon,
                    title: AppText.phoneNumber,
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                      onPress: () {},
                      btnColor: AppColors.primaryColor,
                      child: const GText(
                          color: AppColors.lightGrayColor,
                          content: AppText.next,
                          fontSize: 16
                      )),
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
