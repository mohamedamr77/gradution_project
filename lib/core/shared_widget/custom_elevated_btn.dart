import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../utils/app_colors.dart';
import 'global_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPress;
  final Widget? child;
  final Color? btnColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final BorderSide? borderSide;
  final String titleButton;
  final Color? titleColor;

  const CustomElevatedButton(
      {super.key,
      required this.onPress,
      this.child,
      this.btnColor,
      this.width,
      this.height,
      this.borderSide,
      this.borderRadius,
      required this.titleButton, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 0.90.w, height ?? 0.07.h),
        backgroundColor: btnColor ?? AppColors.primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0.02.w),
          side: borderSide ?? BorderSide.none,
        ),
      ),
      onPressed: onPress,
      child: child ??
          GText(
              color: titleColor?? AppColors.lightGrayColor,
              content: titleButton,
              fontSize: 16),
    );
  }
}
