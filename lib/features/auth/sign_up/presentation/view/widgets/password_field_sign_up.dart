import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';

import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../../core/utils/app_text.dart';
class PasswordFieldSignUp extends StatelessWidget {
  const PasswordFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        hintText: AppText.enterPassword,
        prefix: Padding(padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(AppIcons.passwordIcon)),
        title: AppText.password,
        suffixIcon: const Icon(Icons.visibility_off,color: AppColors.thirdColor,),
    );
  }
}
