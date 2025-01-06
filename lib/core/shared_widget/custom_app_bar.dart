import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'global_text.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: onBackPressed,
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.primaryColor.withOpacity(0.7),
        ),
      ),
      title: GText(
        color: Color(0xff1A1E4C),
        content: title,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
