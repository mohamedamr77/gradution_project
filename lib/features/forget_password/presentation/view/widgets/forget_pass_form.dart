import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/utils/validation_service.dart';
import '../../../../../core/navigation/navigation_manager.dart';
import '../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/locale_keys.g.dart';
import '../verify_code_screen.dart';

class ForgetPassForm extends StatelessWidget {
  const ForgetPassForm({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: SliverToBoxAdapter(
        child: Column(
          children: [
            phoneField(),
            SizedBox(
              height: 0.04.h,
            ),
            buttonNext(formKey),
          ],
        ),
      ),
    );
  }

  Widget phoneField() {
    return CustomTextField(
      hintText: LocaleKeys.enterPhoneNumber.tr(),
      prefix: AppIcons.phoneIcon,
      title: LocaleKeys.phoneNumber.tr(),
      validator: (value) {
        return Validators.validatePhoneNumber(value);
      },
    );
  }

  Widget buttonNext(formKey) {
    return CustomElevatedButton(
      onPress: () {
        if (formKey.currentState!.validate()) {
          NavigationManager.push(VerifyCodeScreen.id);
        }
      },
      btnColor: AppColors.primaryColor,
      titleButton: LocaleKeys.next.tr(),
    );
  }
}
