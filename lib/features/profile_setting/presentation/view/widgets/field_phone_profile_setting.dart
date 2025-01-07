import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_text.dart';
import '../../../../../core/utils/validation_service.dart';

class FieldPhoneProfileSetting extends StatelessWidget {
  const FieldPhoneProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: AppText.enterPhoneNumber,
      prefix: AppIcons.phoneIcon,
      title: AppText.phoneNumber,
      validator: (value) {
        return Validators.validatePhoneNumber(value);
      },
      onChanged: (value) {},
    );
  }
}
