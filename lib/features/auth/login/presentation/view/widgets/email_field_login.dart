import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';

import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/app_text.dart';

class EmailFieldLogin extends StatelessWidget {
 final void Function()? onTap;
 final void Function(String)? onChanged;
  const EmailFieldLogin({super.key, this.onTap, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return   CustomTextField(
      onTap: onTap,
      onChanged: onChanged,
      onTapOutside: (e) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      title: AppText.emailAddress,
      prefix: AppIcons.emailIcon,
      hintText: AppText.enterEmailAddress,
    );
  }
}
