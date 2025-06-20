import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/validation_service.dart';
import '../../../../../core/utils/locale_keys.g.dart';

class FieldPasswordProfileSetting extends StatelessWidget {
  const FieldPasswordProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      obscureText: true,
      hintText: LocaleKeys.enterPassword.tr(),
      prefix: AppIcons.passwordIcon,
      title: LocaleKeys.password.tr(),
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
