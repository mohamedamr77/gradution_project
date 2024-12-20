import 'package:flutter/material.dart';

import '../../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../../core/shared_widget/global_text.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
        borderRadius: 8,
        onPress: () {},
        btnColor: AppColors.primaryColor,
        child: const GText(
            color: AppColors.lightGrayColor,
            content: AppText.createAccount,
            fontSize: 16));
  }
}
