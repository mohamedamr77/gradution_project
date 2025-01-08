import 'package:flutter/material.dart';
import '../../../../../../core/shared_widget/global_text.dart';
import '../../../../../../core/utils/app_colors.dart';

class NotificationDetailsCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  const NotificationDetailsCard({super.key, required this.imagePath, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        color: AppColors.lightGrayColor,
        child: ListTile(
          trailing: Image.asset(imagePath),
          title:  GText(
            color: AppColors.blackColor,
            content: title,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          subtitle:  GText(
            color: AppColors.thirdColor,
            content: subTitle,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
