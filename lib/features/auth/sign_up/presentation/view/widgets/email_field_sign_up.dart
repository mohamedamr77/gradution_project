import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/validation_service.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_state.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/locale_keys.g.dart';
import '../../viewModel/sign_up_cubit.dart';

class EmailFieldSignUp extends StatelessWidget {
  const EmailFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return CustomTextField(
          hintText: LocaleKeys.enterEmailAddress.tr(),
          prefix: AppIcons.nameIcon,
          title: LocaleKeys.emailAddress.tr(),
          validator: (value) {
            return Validators.validateEmail(value);
          },
          onChanged: (v) {
            cubit.email = v;
          },
        );
      },
    );
  }
}
