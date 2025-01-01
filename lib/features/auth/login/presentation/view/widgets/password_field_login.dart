import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/shared_widget/custom_text_form_field.dart';
import 'package:gradutionproject/features/auth/login/presentation/viewModel/login_cubit.dart';
import 'package:gradutionproject/features/auth/login/presentation/viewModel/login_state.dart';

import '../../../../../../core/utils/app_icons.dart';
import '../../../../../../core/utils/app_text.dart';

class PasswordFieldLogin extends StatelessWidget {
  final void Function()? onTap;
  const PasswordFieldLogin({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomTextField(
          obscureText: cubit.visibilityPassword ? true : false,
          title: AppText.password,
          hintText: AppText.enterPassword,
          onTap: onTap,
          suffixIcon: IconButton(
            onPressed: () {
              cubit.toggleVisibilityPassword();
            },
            icon: cubit.visibilityPassword
                ? AppIcons.visibilityOffIcon
                : AppIcons.visibilityIcon,
          ),
          prefix: AppIcons.passwordIcon,

        );
      },
    );
  }
}
