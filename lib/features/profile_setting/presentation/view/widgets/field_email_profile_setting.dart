import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_text.dart';

class FieldEmailProfileSetting extends StatelessWidget {
  const FieldEmailProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onTap: () {},
      onChanged: (value) {},
      onTapOutside: (e) {},
      title: AppText.emailAddress,
      prefix: AppIcons.emailIcon,
      hintText: AppText.enterEmailAddress,
    );
  }
}
