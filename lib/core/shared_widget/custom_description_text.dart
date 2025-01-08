import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'global_text.dart';

class CustomDescriptionText extends StatelessWidget {
  final String title;
  final double? textSize;
  const CustomDescriptionText({super.key, required this.title, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GText(
        color: AppColors.mediumGrayColor,
        content: title,
        fontSize: textSize?? 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
