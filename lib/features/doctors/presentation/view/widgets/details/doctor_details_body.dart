import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_title_text.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../../../../../core/shared_widget/custom_description_text.dart';
import '../../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../auth/shared_widget_auth/social_auth_section.dart';

class DoctorDetailsBody extends StatelessWidget {
  const DoctorDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ReusableItemCard(
              imagePath: AppImages.doctorAmrTest,
              title: "د / محمد عمرو",
              description: "اخصائى اطفال",
              subDescription: "يتم اخده مره واحده",
              onPressedIconFavourite: () {},
              onTapCard: () {},
              isDoctor: true,
              isRating: 4.5,
              isDetails: true,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
          SliverToBoxAdapter(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SocialContainerItem(
                onTap: () {},
                iconPath: AppIcons.facebookIcon,
              ),
              SocialContainerItem(
                onTap: () {},
                iconPath: AppImages.whatsImage,
              ),
              SocialContainerItem(
                onTap: () {},
                iconPath: AppImages.phoneImage,
              ),
            ],
          )),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
          const SliverToBoxAdapter(
              child: CustomTitleText(title: AppText.doctorDetails)),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomDescriptionText(
              title: AppText.doctorDescription,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          const SliverToBoxAdapter(
              child: CustomTitleText(title: AppText.workHours)),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomDescriptionText(
              title: AppText.workSchedule,
            ),
          ),
        ],
      ),
    );
  }
}
