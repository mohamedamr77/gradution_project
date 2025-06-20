import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/validation_service.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_cubit.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_state.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../../core/utils/locale_keys.g.dart';

class PasswordFieldSignUp extends StatelessWidget {
  const PasswordFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return CustomTextField(
          obscureText: cubit.visibilityPassword ? true : false,
          hintText: LocaleKeys.enterPassword.tr(),
          keyboardType: TextInputType.visiblePassword,
          prefix: AppIcons.passwordIcon,
          title: LocaleKeys.password.tr(),
          suffixIcon: IconButton(
            onPressed: () {
              cubit.toggleVisibilityPassword();
            },
            icon: cubit.visibilityPassword
                ? AppIcons.visibilityOffIcon
                : AppIcons.visibilityIcon,
          ),
          validator: (value) {
            return Validators.validatePassword(value);
          },
          onChanged: (v) {
            cubit.password = v;
          },
        );
      },
    );
  }
}
