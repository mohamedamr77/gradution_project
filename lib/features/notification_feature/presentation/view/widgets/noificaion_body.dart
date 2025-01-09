import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/notification_feature/presentation/view/widgets/notification_item.dart';

import '../notification_details_screen.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          _buildRowOfText(),
          _builderSpacer(height: 24),
          NotificationItem(
              onTapIconRemove: () {},
              onTapCard: () =>
                  NavigationManager.push(NotificationDetailsScreen.id),
              title: AppText.tuberculosisVaccineAppointment,
              subTitle: AppText.subtitleNotification)
        ],
      ),
    );
  }

  SliverToBoxAdapter _builderSpacer({required double height}) {
    return SliverToBoxAdapter(
        child: SizedBox(
      height: height,
    ));
  }

  SliverToBoxAdapter _buildRowOfText() {
    return SliverToBoxAdapter(
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const GText(
            color: AppColors.thirdColor,
            content: AppText.today,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          TextButton(
              onPressed: () {},
              child: const GText(
                color: AppColors.primaryColor,
                content: AppText.markAsRead,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ))
        ],
      ),
    );
  }
}
