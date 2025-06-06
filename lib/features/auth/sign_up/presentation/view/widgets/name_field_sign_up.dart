import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_state.dart';

import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/app_text.dart';
import '../../../../../../core/utils/validation_service.dart';
import '../../viewModel/sign_up_cubit.dart';

class NameFieldSignUp extends StatelessWidget {
  final String hintText;
  final String title;
  final void Function(String)? onChanged;
  const NameFieldSignUp({super.key, required this.hintText, required this.title, this.onChanged});

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
