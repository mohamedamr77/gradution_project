import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/validation_service.dart';
import '../../../../../core/utils/locale_keys.g.dart';

class FieldPhoneProfileSetting extends StatelessWidget {
  const FieldPhoneProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: LocaleKeys.enterPhoneNumber.tr(),
      prefix: AppIcons.phoneIcon,
      title: LocaleKeys.phoneNumber.tr(),
      validator: (value) {
        return Validators.validatePhoneNumber(value);
      },
      onChanged: (value) {},
    );
  }
}
