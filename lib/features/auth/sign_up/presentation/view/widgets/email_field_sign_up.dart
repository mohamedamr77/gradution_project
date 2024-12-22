import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/validation_service.dart';

import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/app_text.dart';

class EmailFieldSignUp extends StatelessWidget {
  const EmailFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomTextField(
        hintText: AppText.enterEmailAddress,
        prefix: AppIcons.nameIcon,
        title: AppText.emailAddress,
       validator: (value){
         return  Validators.validateEmail(value);
       },
    );
  }
}
