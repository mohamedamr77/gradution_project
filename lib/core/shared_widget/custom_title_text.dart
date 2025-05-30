import 'package:flutter/material.dart';

import '../../../../../../core/shared_widget/global_text.dart';
import '../../../../../../core/utils/app_colors.dart';

class CustomTitleText extends StatelessWidget {
  final String title;
  const CustomTitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: GText(
          color: AppColors.primaryColor,
          content: title,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ));
  }
}
