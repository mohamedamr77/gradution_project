import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_cubit.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_state.dart';
import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../../core/utils/app_text.dart';

class PasswordFieldSignUp extends StatelessWidget {
  const PasswordFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return CustomTextField(
            obscureText: cubit.visibilityPassword ? true : false,
            hintText: AppText.enterPassword,
            prefix: AppIcons.passwordIcon,
            title: AppText.password,
            suffixIcon: IconButton(
                onPressed: () {
                  cubit.toggleVisibilityPassword();
                },
                icon: cubit.visibilityPassword
                    ? AppIcons.visibilityOffIcon
                    : AppIcons.visibilityIcon,
            )
        );
      },
    );
  }
}