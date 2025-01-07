import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../../../../../core/shared_widget/custom_title_text.dart';
import '../../../../../../core/shared_widget/global_text.dart';
import '../../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_text.dart';
import '../../../../../vaccination_tips/data/model/tips_before_vaccine_list.dart';

class SideEffectDetailsBody extends StatelessWidget {
  const SideEffectDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          _buildReusableItemCard(),
          _buildSpacer(height: 24),
          _buildSectionTitle(AppText.commonSideEffects),
          _buildSpacer(height: 16),
          _buildTipsList(tipsBeforeVaccineList),
          _buildSpacer(height: 24),
          _buildSectionTitle(AppText.intermittentSideEffects),
          _buildSpacer(height: 16),
          _buildTipsList(tipsBeforeVaccineList),
          _buildSpacer(height: 24),
          _buildSectionTitle(AppText.handlingSideEffects),
          _buildSpacer(height: 24),
        ],
      ),
    );
  }
  SliverToBoxAdapter _buildReusableItemCard() {
    return SliverToBoxAdapter(
      child: ReusableItemCard(
        imagePath: AppImages.tuberVaccineTest,
        title: AppText.rotavirusVaccine,
        description: "فعال بنسبة99%",
        subDescription: "يتم اخده مره واحده",
        onPressedIconFavourite: () {},
        onTapCard: () {},
        isDetails: true,
      ),
    );
  }

  SliverToBoxAdapter _buildSpacer({required double height}) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }

  SliverToBoxAdapter _buildSectionTitle(String title) {
    return SliverToBoxAdapter(
      child: CustomTitleText(title: title),
    );
  }

  SliverList _buildTipsList(List<String> tipsList) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return GText(
          color: AppColors.mediumGrayColor,
          content: "${index + 1} . ${tipsList[index]}",
          fontSize: 14,
          fontWeight: FontWeight.w400,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemCount: tipsList.length,
    );
  }
}
