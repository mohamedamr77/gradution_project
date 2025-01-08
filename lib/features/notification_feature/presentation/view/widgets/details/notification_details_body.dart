import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/notification_feature/presentation/view/widgets/details/notification_details_card.dart';

class NotificationDetailsBody extends StatelessWidget {
  const NotificationDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          _buildSpacer(height: 16),
          const NotificationDetailsCard(imagePath: AppImages.childTest, title: AppText.childName,subTitle: AppText.yearAndFourMonth,)

        ],
      ),
    );
  }
  SliverToBoxAdapter _buildSpacer({required double height}){
    return SliverToBoxAdapter(child: SizedBox(height: height,));
  }
}
