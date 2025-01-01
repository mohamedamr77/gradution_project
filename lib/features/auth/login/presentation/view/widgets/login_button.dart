import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/auth/login/presentation/viewModel/login_cubit.dart';

import '../../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    return CustomElevatedButton(
        borderRadius: 8,
        onPress: () {
          cubit.loginClick();
        },
        btnColor: AppColors.primaryColor,
        titleButton: AppText.login,
    );
  }
}
