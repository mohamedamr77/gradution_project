import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/shared_widget/name_screen.dart';
import 'package:gradutionproject/core/shared_widget/text_with_action_row%20.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/image_forget_password.dart';

class VerifyCodeBody extends StatelessWidget {
  const VerifyCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
          const SizedBox(height: 64,),
         const NameScreen(title: AppText.passwordResetCode),
         const SizedBox(height: 40,),
         const ImageForgetPassword(imagePath: AppImages.confirmOtpScreen),
         const SizedBox(height: 40,),
         CustomElevatedButton(onPress: (){}, titleButton: AppText.confirm),
         const SizedBox(height: 20,),
        TextWithActionRow(titleOnTap: AppText.resendCode, titleWithoutTap: AppText.notHaveCode, onTap: () {

          },)
      ],
    );
  }
}
