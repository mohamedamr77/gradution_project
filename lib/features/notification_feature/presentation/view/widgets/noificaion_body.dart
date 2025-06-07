import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/notification_feature/presentation/view/widgets/notification_item.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/utils/locale_keys.g.dart';

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
              title: LocaleKeys.tuberculosisVaccineAppointment.tr(),
              subTitle: LocaleKeys.subtitleNotification.tr())
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
        children: [
          Text(
            LocaleKeys.today.tr(),
            style: const TextStyle(
              color: AppColors.thirdColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.markAsRead.tr(),
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
