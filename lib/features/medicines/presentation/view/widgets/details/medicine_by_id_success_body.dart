import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/shared_model/resuable_model.dart';
import '../../../../../../core/shared_widget/custom_title_text.dart';
import '../../../../../../core/shared_widget/global_text.dart';
import '../../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/locale_keys.g.dart';
import '../../../../data/model/medication_model.dart';

class MedicineByIdSuccessBody extends StatelessWidget {
  final MedicationModel medicationModel;
  const MedicineByIdSuccessBody({super.key, required this.medicationModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: CustomScrollView(
        slivers: [
          _buildReusableItemCard(medicationModel: medicationModel),
          _buildSpacer(height: 24),
          _buildSectionTitle(LocaleKeys.description.tr()),
          _buildSpacer(height: 16),
          _buildTipsDescription(medicationModel.description.toString()),
          _buildSpacer(height: 24),
          _buildSectionTitle(LocaleKeys.dosage.tr()),
          _buildSpacer(height: 16),
          _buildTipsDescription(medicationModel.dosage.toString()),
          _buildSpacer(height: 24),
          _buildSectionTitle(LocaleKeys.sideEffects.tr()),
          _buildSpacer(height: 16),
          sideEffectsDescription(medicationModel.sideEffects ?? []),
        ],
      ),
    );
  }

   sideEffectsDescription(List<String> sideEffects) {
    return SliverList.separated(
        itemBuilder: (context, index) {
          return GText(
            color: AppColors.mediumGrayColor,
            content: "${index+1} . ${sideEffects[index]}",
            fontSize: 14,
            fontWeight: FontWeight.w400,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8);
        },
         itemCount: sideEffects.length,
    );
  }
  SliverToBoxAdapter _buildReusableItemCard({required MedicationModel medicationModel}) {
    return SliverToBoxAdapter(
      child: ReusableItemCard(
        reusableModel: ReusableModel(
          imagePath: medicationModel.image ?? AppImages.tuberVaccineTest,
          title: medicationModel.name ?? LocaleKeys.loremIpsumExample1.tr(),
          description: "${medicationModel.price.toString()} جنيه "?? LocaleKeys.loremIpsumExample1.tr(),
          subDescription:  medicationModel.category ?? LocaleKeys.loremIpsumExample1.tr(),
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
