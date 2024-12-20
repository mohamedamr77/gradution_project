import 'package:flutter/material.dart';

import '../../../core/shared_widget/global_text.dart';
import '../../../core/utils/app_colors.dart';

class NameScreenAuth extends StatelessWidget {
  final String title;
  const NameScreenAuth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GText(
      color: AppColors.primaryColor,
      content: title,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      textAlign: TextAlign.center,
    );
  }
}
