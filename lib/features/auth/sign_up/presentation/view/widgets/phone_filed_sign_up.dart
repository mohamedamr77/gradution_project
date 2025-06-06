import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_cubit.dart';

import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/app_text.dart';
import '../../../../../../core/utils/validation_service.dart';

class PhoneFiledSignUp extends StatelessWidget {
  const PhoneFiledSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignUpCubit>(context);
    return CustomTextField(
      maxLength: 11,
      keyboardType: TextInputType.phone,
      hintText: AppText.enterPhoneNumber,
      prefix: AppIcons.phoneIcon,
      title: AppText.phoneNumber,
      validator: (value) {
        return Validators.validatePhoneNumber(value);
      },
      onChanged: (value) {
        cubit.phoneNumber = value;
      },
    );
  }
}
