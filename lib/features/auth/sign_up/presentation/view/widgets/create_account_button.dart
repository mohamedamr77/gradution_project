import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/toast_utils.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_cubit.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_state.dart';
import 'package:gradutionproject/features/child_information/presentation/view/child_info_screen.dart';

import '../../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text.dart';

class CreateAccountButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const CreateAccountButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignUpCubit>(context);
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpWithEmailSuccessState) {
          ToastUtils.showToast(
              message: "تم تسجيل الدخول بنجاح",
              backgroundColor: AppColors.greenColor);
          NavigationManager.replaceAll(ChildInfoScreen.id);
        } else if (state is SignUpWithEmailFailureState) {
          ToastUtils.showToast(message: state.error);
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          borderRadius: 8,
          onPress: () {
            if (formKey.currentState!.validate()) {
              cubit.signUpWithEmail();
            }
          },
          btnColor: AppColors.primaryColor,
          titleButton: AppText.createAccount,
        );
      },
    );
  }
}
