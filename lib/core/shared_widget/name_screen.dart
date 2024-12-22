import 'package:flutter/material.dart';

import 'global_text.dart';
import '../utils/app_colors.dart';

class NameScreen extends StatelessWidget {
  final String title;
  const NameScreen({super.key, required this.title});

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
