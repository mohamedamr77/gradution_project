import 'package:flutter/material.dart';

import '../navigation/navigation_manager.dart';
import '../utils/app_colors.dart';
import 'global_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? iconArrowColor;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    required this.title,
     this.onBackPressed,
    this.actions, this.iconArrowColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: onBackPressed ?? (){
          NavigationManager.goBack();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: iconArrowColor ?? AppColors.primaryColor.withOpacity(0.7),
        ),
      ),
      title: GText(
        color: const Color(0xff1A1E4C),
        content: title,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
