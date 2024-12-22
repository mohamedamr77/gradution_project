import 'package:flutter/material.dart';

import '../../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
        borderRadius: 8,
        onPress: () {},
        btnColor: AppColors.primaryColor,
        titleButton: AppText.login,
    );
  }
}
