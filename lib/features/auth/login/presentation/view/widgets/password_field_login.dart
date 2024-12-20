import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/shared_widget/custom_text_form_field.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../../core/utils/app_text.dart';

class PasswordFieldLogin extends StatelessWidget {
  const PasswordFieldLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      title: AppText.password,
      hintText: AppText.enterPassword,
      suffixIcon: const Icon(
        Icons.visibility_off,
        color: AppColors.thirdColor,
      ),
      prefix: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(AppIcons.passwordIcon)),
    );
  }
}
