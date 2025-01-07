import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

class ImageForgetPassword extends StatelessWidget {
  final String imagePath;
  const ImageForgetPassword({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.contain,
      width: double.infinity,
      height: 0.33.h,
    );
  }
}
