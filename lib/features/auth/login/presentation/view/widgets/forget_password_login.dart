import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/locale_keys.g.dart';
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
            child: GText(
                color: AppColors.thirdColor,
                content: LocaleKeys.forgotPassword.tr(),
                fontSize: 14)));
  }
}
