import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_state.dart';
import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../../core/utils/app_text.dart';
import '../../viewModel/sign_up_cubit.dart';

class ConfirmPassFieldSignUp extends StatelessWidget {
  const ConfirmPassFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return CustomTextField(
            hintText: AppText.enterPassword,
            prefix: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(AppIcons.passwordIcon)),
            title: AppText.confirmPassword,
            obscureText: cubit.visibilityPassword? true :false,
            suffixIcon: IconButton(
                onPressed: () {
                  cubit.toggleVisibilityConfirmPassword();
                },
                icon: cubit.visibilityConfirmPassword
                    ? const Icon(
                        Icons.visibility_off,
                        color: AppColors.thirdColor,
                      )
                    : const Icon(
                        Icons.visibility,
                        color: AppColors.thirdColor,
                      )));
      },
    );
  }
}