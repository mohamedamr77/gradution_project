import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/locale_keys.g.dart';

class FieldEmailProfileSetting extends StatelessWidget {
  const FieldEmailProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onTap: () {},
      onChanged: (value) {},
      onTapOutside: (e) {},
      title: LocaleKeys.emailAddress.tr(),
      prefix: AppIcons.emailIcon,
      hintText: LocaleKeys.enterEmailAddress.tr(),
    );
  }
}
