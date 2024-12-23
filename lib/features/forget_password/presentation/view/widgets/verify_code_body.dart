import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/shared_widget/name_screen.dart';
import 'package:gradutionproject/core/shared_widget/text_with_action_row%20.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/image_forget_password.dart';

import '../change_pass_screen.dart';
import 'otp_text_form_field.dart';

class VerifyCodeBody extends StatefulWidget {
  const VerifyCodeBody({super.key});

  @override
  State<VerifyCodeBody> createState() => _VerifyCodeBodyState();
}

class _VerifyCodeBodyState extends State<VerifyCodeBody> {
  TextEditingController? numberOneController;
  TextEditingController? numberTwoController;
  TextEditingController? numberThreeController;
  TextEditingController? numberFourController;

  bool isButtonEnabled = false;


  void checkFieldsFilled() {
    setState(() {
      isButtonEnabled = (numberOneController?.text.isNotEmpty ?? false) &&
          (numberTwoController?.text.isNotEmpty ?? false) &&
          (numberThreeController?.text.isNotEmpty ?? false) &&
          (numberFourController?.text.isNotEmpty ?? false) ;
    });
  }

  @override
  void initState() {
    super.initState();

    numberOneController = TextEditingController();
    numberTwoController = TextEditingController();
    numberThreeController = TextEditingController();
    numberFourController = TextEditingController();

    // Add listeners to the text fields to check when the content changes
    numberOneController?.addListener(checkFieldsFilled);
    numberTwoController?.addListener(checkFieldsFilled);
    numberThreeController?.addListener(checkFieldsFilled);
    numberFourController?.addListener(checkFieldsFilled);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    numberOneController?.dispose();
    numberTwoController?.dispose();
    numberThreeController?.dispose();
    numberFourController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              const NameScreen(title: AppText.passwordResetCode),
              const Spacer(),
              const ImageForgetPassword(imagePath: AppImages.confirmOtpScreen),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OTPTextFormField(controller: numberOneController),
                  OTPTextFormField(controller: numberTwoController),
                  OTPTextFormField(controller: numberThreeController),
                  OTPTextFormField(controller: numberFourController),
                ],
              ),
              const Spacer(),
              CustomElevatedButton(
                  btnColor: isButtonEnabled == false? AppColors.thirdColor :AppColors.primaryColor ,
                  onPress:
                  isButtonEnabled?
                      () {
                    NavigationManager.push(ChangePasswordScreen.id);
                  } :
                      () {},
                  titleButton: AppText.confirm),
              const Spacer(),
              TextWithActionRow(
                titleOnTap: AppText.resendCode,
                titleWithoutTap: AppText.notHaveCode,
                onTap: () {},
              ),
              const Spacer(flex: 3,),
            ],
          ),
        )
      ],
    );
  }
}
