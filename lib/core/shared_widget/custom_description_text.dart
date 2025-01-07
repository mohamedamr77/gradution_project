import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'global_text.dart';

class CustomDescriptionText extends StatelessWidget {
  final String title;
  const CustomDescriptionText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GText(
      color: AppColors.mediumGrayColor,
      content: title,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }
}
