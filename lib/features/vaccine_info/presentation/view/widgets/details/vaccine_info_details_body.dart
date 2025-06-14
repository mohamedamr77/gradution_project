import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/shared_model/resuable_model.dart';

import '../../../../../../core/shared_widget/custom_description_text.dart';
import '../../../../../../core/shared_widget/custom_title_text.dart';
import '../../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/locale_keys.g.dart';

class VaccineInfoDetailsBody extends StatelessWidget {
  const VaccineInfoDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          _buildSpacer(height: 24),
          _buildSectionTitle(LocaleKeys.beforeVaccination.tr()),
          _buildSpacer(height: 16),
          _buildTipsDescription(LocaleKeys.loremIpsumExample1.tr()),
          _buildSpacer(height: 24),
          _buildSectionTitle(LocaleKeys.postVaccination.tr()),
          _buildSpacer(height: 16),
          _buildTipsDescription(LocaleKeys.loremIpsumExample1.tr()),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildReusableItemCard() {
    return SliverToBoxAdapter(
      child: ReusableItemCard(
        reusableModel: ReusableModel(
          imagePath: AppImages.tuberVaccineTest,
          title: LocaleKeys.rotavirusVaccine.tr(),
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

  SliverToBoxAdapter _buildTipsDescription(String title) {
    return SliverToBoxAdapter(
      child: CustomDescriptionText(
        title: title,
      ),
    );
  }
}
