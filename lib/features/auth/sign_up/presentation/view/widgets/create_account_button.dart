import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_cubit.dart';

import '../../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../../core/shared_widget/global_text.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text.dart';

class CreateAccountButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CreateAccountButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    var cubit =BlocProvider.of<SignUpCubit>(context);
    return CustomElevatedButton(
        borderRadius: 8,
        onPress: () {
          if (formKey.currentState!.validate()) {
            // cubit.regesterOperation();
          }
        },
        btnColor: AppColors.primaryColor,
        child: const GText(
            color: AppColors.lightGrayColor,
            content: AppText.createAccount,
            fontSize: 16));
  }
}
