import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../features/notification_feature/presentation/view/noificaion_screen.dart';

class HeaderBottomNavBarScreen extends StatelessWidget {
  const HeaderBottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 0.109.w,
          child: Image.asset(AppImages.lailaTest),
        ),
        const SizedBox(
          width: 8,
        ),
        const FittedBox(
            fit: BoxFit.scaleDown,
            child: GText(
              color: AppColors.primaryColor,
              content: AppText.welcomeLily,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )),
        const Spacer(),
        IconButton(
            onPressed: () {
              NavigationManager.push(NotificationScreen.id);
            },
            icon: SvgPicture.asset(AppIcons.notificationIcon)),
        // SizedBox(
        //   width: 0.09.w,
        // ),
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: SvgPicture.asset(
            AppIcons.drawerIcon,
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    );
  }
}
