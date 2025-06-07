import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';

import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/validation_service.dart';

class NameFieldSignUp extends StatelessWidget {
  final String hintText;
  final String title;
  final void Function(String)? onChanged;
  const NameFieldSignUp(
      {super.key, required this.hintText, required this.title, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: hintText,
      prefix: AppIcons.nameIcon,
      title: title,
      validator: (value) {
        return Validators.validateName(value);
      },
      onChanged: onChanged,
    );
  }
}
