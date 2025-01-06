import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../utils/app_colors.dart';
import 'global_text.dart';

class ButtonListHorizontal extends StatelessWidget {
  final void Function()? onTap;
  final List<String> buttonNames;
  final int index;
  final int buttonSelectedIndex;

  const ButtonListHorizontal({super.key, this.onTap, required this.buttonNames, required this.index, required this.buttonSelectedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap:  onTap,
        child: Container(
          width: 0.42.w,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: index == buttonSelectedIndex
                ? AppColors.primaryColor
                : AppColors.secondaryColor,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: GText(
              color: index == buttonSelectedIndex
                  ? AppColors.whiteColor
                  : AppColors.primaryColor,
              content : buttonNames[index],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}