import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/locale_keys.g.dart';

class TextTopScreenChildInfo extends StatelessWidget {
  const TextTopScreenChildInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GText(
          textAlign: TextAlign.center,
          color: AppColors.primaryColor,
          content: LocaleKeys.welcomeMessage.tr(),
          fontSize: 18),
    );
  }
}
