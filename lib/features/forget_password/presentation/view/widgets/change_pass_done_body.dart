import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../core/shared_widget/name_screen.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text.dart';
import 'image_forget_password.dart';

class ChangePassDoneBody extends StatelessWidget {
  const ChangePassDoneBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 0.05.h),
                  const ImageForgetPassword(
                      imagePath: AppImages.changePassDone),
                  SizedBox(height: 0.04.h),
                  const NameScreen(title: AppText.passwordChanged),
                  SizedBox(height: 0.04.h),
                  CustomElevatedButton(
                    onPress: () {
                      // Add your navigation or action here
                    },
                    btnColor: AppColors.primaryColor,
                    titleButton: AppText.login,
                  ),
                  SizedBox(height: 0.05.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
