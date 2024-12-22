import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/login_screen.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_state.dart';
import '../../../../../../core/utils/app_text.dart';
import '../../../../shared_widget_auth/have_or_not_account_auth.dart';
import '../../viewModel/sign_up_cubit.dart';

class HaveAccountSignup extends StatelessWidget {
  const HaveAccountSignup({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return HaveOrNotAccountAuth(
          titleOnTap: AppText.login,
          titleWithoutTap: AppText.alreadyHaveAccount,
          onTap: () {
            cubit.resetState();
            NavigationManager.push(LoginScreen.id);
          },
        );
      },
    );
  }
}