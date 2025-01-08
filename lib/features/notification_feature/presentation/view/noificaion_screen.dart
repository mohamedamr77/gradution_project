import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/features/notification_feature/presentation/view/widgets/noificaion_body.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text.dart';

class NotificationScreen extends StatelessWidget {
  static String id = "notification_screen";
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarNotificationsScreen(),
      body: const NotificationBody(),
    );
  }

  CustomAppBar _appBarNotificationsScreen() {
    return CustomAppBar(
      actions: [
        IconButton(
            onPressed: () {
            },
            icon: SvgPicture.asset(AppIcons.trash))
      ],
      iconArrowColor: AppColors.thirdColor,
      title: AppText.notifications,
    );
  }
}
