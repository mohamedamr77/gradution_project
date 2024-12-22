import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_state.dart';

import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/app_text.dart';
import '../../../../../../core/utils/validation_service.dart';
import '../../viewModel/sign_up_cubit.dart';

class NameFieldSignUp extends StatelessWidget {
  const NameFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return CustomTextField(
          hintText: AppText.enterYourName,
          prefix: AppIcons.nameIcon,
          title: AppText.name,
          validator: (value) {
            return Validators.validateName(value);
          },
          onChanged: (v) {
             cubit.name =v;
          },
        );
      },
    );
  }
}
