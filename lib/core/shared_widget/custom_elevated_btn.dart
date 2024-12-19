import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPress;
  final Widget child;
  final Color btnColor;
  final double? width;
  final double? height;
  final BorderSide? borderSide;

  const CustomElevatedButton(
      {super.key,
      required this.onPress,
      required this.child,
      required this.btnColor,
      this.width,
      this.height,
      this.borderSide});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 0.90.w, height ?? 0.07.h),
        backgroundColor: btnColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.01.w),
          side: borderSide ?? BorderSide.none,
        ),
      ),
      onPressed: onPress,
      child: child,
    );
  }
}
