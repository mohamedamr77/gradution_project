import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text.dart';
import '../../../../../forget_password/presentation/view/forget_pass_screen.dart';

class ForgetPasswordLogin extends StatelessWidget {
  const ForgetPasswordLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
            onTap: () {
              NavigationManager.push(ForgetPassScreen.id);
            },
            child: const GText(
                color: AppColors.thirdColor,
                content: AppText.forgotPassword,
                fontSize: 14)));
  }
}
