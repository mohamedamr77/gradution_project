import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_text.dart';
import '../../../../../core/utils/validation_service.dart';

class FieldNameProfileSetting extends StatelessWidget {
  const FieldNameProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: AppText.enterYourName,
      prefix: AppIcons.nameIcon,
      title: AppText.name,
      validator: (value) {
        return Validators.validateName(value);
      },
      onChanged: (v) {},
    );
  }
}
