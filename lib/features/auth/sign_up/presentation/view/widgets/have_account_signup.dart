import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/login_screen.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_state.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/utils/locale_keys.g.dart';
import '../../../../../../core/shared_widget/text_with_action_row .dart';
import '../../viewModel/sign_up_cubit.dart';

class HaveAccountSignup extends StatelessWidget {
  const HaveAccountSignup({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return TextWithActionRow(
          titleOnTap: LocaleKeys.login.tr(),
          titleWithoutTap: LocaleKeys.alreadyHaveAccount.tr(),
          onTap: () {
            cubit.resetState();
            NavigationManager.push(LoginScreen.id);
          },
        );
      },
    );
  }
}
