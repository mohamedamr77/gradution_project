import 'package:flutter/material.dart';
import 'global_text.dart';
import '../utils/app_colors.dart';

class CustomChildTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final Widget? leading;
  const CustomChildTile(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subTitle,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightGrayColor,
      child: ListTile(
        leading: leading,
        trailing: Image.asset(imagePath),
        title: GText(
          color: AppColors.blackColor,
          content: title,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        subtitle: GText(
          color: AppColors.thirdColor,
          content: subTitle,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
