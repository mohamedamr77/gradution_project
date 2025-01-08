import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/shared_model/resuable_model.dart';

import '../../../../../../core/shared_widget/custom_title_text.dart';
import '../../../../../../core/shared_widget/global_text.dart';
import '../../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_text.dart';

class VaccineInfoDetailsBody extends StatelessWidget {
  const VaccineInfoDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          _buildReusableItemCard(),
          _buildSpacer(height: 24),
          _buildSectionTitle(AppText.beforeVaccination),
          _buildSpacer(height: 16),
          _buildTipsDescription(AppText.loremIpsumExample1),
          _buildSpacer(height: 24),
          _buildSectionTitle(AppText.postVaccination),
          _buildSpacer(height: 16),
          _buildTipsDescription(AppText.loremIpsumExample1),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildReusableItemCard() {
    return SliverToBoxAdapter(
      child: ReusableItemCard(
        reusableModel: ReusableModel(
          imagePath: AppImages.tuberVaccineTest,
          title: AppText.rotavirusVaccine,
          description: "فعال بنسبة99%",
          subDescription: "يتم اخده مره واحده",
          onPressedIconFavourite: () {},
          onTapCard: () {},
          isDetails: true,
        ),

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

  _buildTipsDescription(String description) {
    return SliverToBoxAdapter(
      child: GText(
        color: AppColors.mediumGrayColor,
        content: description,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
