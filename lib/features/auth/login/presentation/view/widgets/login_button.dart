import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/auth/login/presentation/viewModel/login_cubit.dart';
import 'package:gradutionproject/features/auth/login/presentation/viewModel/login_state.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/locale_keys.g.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomElevatedButton(
          borderRadius: 8,
          onPress: () {
            cubit.loginWithEmail();
          },
          btnColor: AppColors.primaryColor,
          titleButton: LocaleKeys.login.tr(),
        );
      },
    );
  }
}
