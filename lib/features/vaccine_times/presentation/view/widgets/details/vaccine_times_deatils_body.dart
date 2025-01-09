import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_description_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/shared_model/resuable_model.dart';

import '../../../../../../core/shared_widget/custom_title_text.dart';
import '../../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_text.dart';

class VaccineTimesDetailsBody extends StatelessWidget {
  const VaccineTimesDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          _buildReusableItemCard(),
          _buildSpacer(height: 24),
          _buildSectionTitle(AppText.doseCount),
          _buildSpacer(height: 16),
          _buildSectionDescription("جرعتان أو ثلاث (حسب نوع اللقاح)."),
          _buildSpacer(height: 24),
          _buildSectionTitle(AppText.timeline),
          _buildSpacer(height: 16),
          _buildSectionDescription(AppText.timeLineDetails),
          _buildSpacer(height: 24),
          _buildSectionTitle(AppText.sideEffectsLabel),
          _buildSpacer(height: 16),
          _buildSectionDescription(AppText.sideEffectDetails),
          _buildSpacer(height: 24),
          _buildSectionTitle(AppText.medicationsForSideEffects),
          _buildSpacer(height: 16),
          _buildSectionDescription(AppText.medicationsForSideEffectsDetails)
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

  SliverToBoxAdapter _buildSectionDescription(String title) {
    return SliverToBoxAdapter(
      child: CustomDescriptionText(title: title),
    );
  }
}
