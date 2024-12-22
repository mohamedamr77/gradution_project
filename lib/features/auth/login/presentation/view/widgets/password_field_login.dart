import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_text_form_field.dart';

import '../../../../../../core/utils/app_icons.dart';
import '../../../../../../core/utils/app_text.dart';

class PasswordFieldLogin extends StatelessWidget {
  const PasswordFieldLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      title: AppText.password,
      hintText: AppText.enterPassword,
      suffixIcon: AppIcons.visibilityIcon,
      prefix: AppIcons.passwordIcon,
    );
  }
}
