import 'package:flutter/material.dart';

import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text.dart';

class EmailFieldSignUp extends StatelessWidget {
  const EmailFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(
        hintText: AppText.enterEmailAddress,
        prefix: Icon(
          Icons.email,
          color: AppColors.thirdColor,
        ),
        title: AppText.emailAddress);
  }
}
