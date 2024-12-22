import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/shared_widget/name_screen.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/image_forget_password.dart';

class VerifyCodeBody extends StatelessWidget {
  const VerifyCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
          SizedBox(height: 64,),
         NameScreen(title: AppText.passwordResetCode),
         SizedBox(height: 40,),
         ImageForgetPassword(imagePath: AppImages.confirmOtpScreen),
         SizedBox(height: 40,),
         CustomElevatedButton(onPress: (){}, titleButton: AppText.confirm)
      ],
    );
  }
}
