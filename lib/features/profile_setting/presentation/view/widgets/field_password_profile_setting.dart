import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_text.dart';
import '../../../../../core/utils/validation_service.dart';

class FieldPasswordProfileSetting extends StatelessWidget {
  const FieldPasswordProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      obscureText: true,
      hintText: AppText.enterPassword,
      prefix: AppIcons.passwordIcon,
      title: AppText.password,
      suffixIcon: IconButton(
        onPressed: () {},
        icon: AppIcons.visibilityOffIcon,
      ),
      validator: (value) {
        return Validators.validatePassword(value);
      },
      onChanged: (v) {},
    );
  }
}
