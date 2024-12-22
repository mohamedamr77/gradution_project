import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';

import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/app_text.dart';

class EmailFieldLogin extends StatelessWidget {
  const EmailFieldLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CustomTextField(
      title: AppText.emailAddress,
      prefix: AppIcons.emailIcon,
      hintText: AppText.enterEmailAddress,
    );
  }
}
