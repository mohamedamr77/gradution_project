import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text.dart';

class TextTopScreenChildInfo extends StatelessWidget {
  const TextTopScreenChildInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: GText(
          textAlign: TextAlign.center,
          color: AppColors.primaryColor,
          content: AppText.welcomeMessage,
          fontSize: 18),
    );
  }
}
