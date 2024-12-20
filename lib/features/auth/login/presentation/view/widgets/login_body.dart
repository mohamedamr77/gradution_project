import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/shared_widget/custom_text_form_field.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_text.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16 , vertical: 16 ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            const GText(color: AppColors.primaryColor, content: AppText.createNewAccount, fontSize: 20, fontWeight:FontWeight.w700,textAlign: TextAlign.center,),
            const SizedBox(height: 32,),
            const CustomTextField(
                hintText: AppText.enterYourName,
                prefix: Icon(Icons.person,color: AppColors.thirdColor,),
                title: AppText.name
            ),
            const SizedBox(height: 16,),
            const CustomTextField(
                hintText: AppText.enterPhoneNumber,
                prefix: Icon(Icons.phone,color: AppColors.thirdColor,),
                title: AppText.phoneNumber
            ),
            const SizedBox(height: 16,),
            const CustomTextField(
                hintText: AppText.enterEmailAddress,
                prefix: Icon(Icons.email,color: AppColors.thirdColor,),
                title: AppText.emailAddress
            ),
            const SizedBox(height: 16,),
            CustomTextField(
                hintText: AppText.enterPassword,
                prefix: Padding(padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(AppIcons.passwordIcon)),
                title: AppText.password
            ),
            const SizedBox(height: 16,),
            CustomTextField(
                hintText: AppText.enterPassword,
                prefix: Padding(padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(AppIcons.passwordIcon)),
                title: AppText.confirmPassword
            ),

          ],
        ),
      ),
    );
  }
}
