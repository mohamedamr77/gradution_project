import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';

import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/app_text.dart';

class PhoneFiledSignUp extends StatelessWidget {
  const PhoneFiledSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CustomTextField(
        hintText: AppText.enterPhoneNumber,
        prefix: AppIcons.phoneIcon,
        title: AppText.phoneNumber);
  }
}
