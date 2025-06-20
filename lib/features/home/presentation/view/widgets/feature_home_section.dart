import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/features/side_effects/presentation/view/side_effect_screen.dart';
import 'package:gradutionproject/features/vaccination_tips/presentation/view/vaccination_tips_screen.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/locale_keys.g.dart';
import '../../../../medicines/presentation/view/medicines_screen.dart';
import '../../../../vaccine_info/presentation/view/vaccine_info_screen.dart';
import 'feature_home_widget.dart';

class FeatureHomeSection extends StatelessWidget {
  const FeatureHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            FeatureHomeWidget(
              imagePath: AppImages.articleSideEffectHome,
              title: LocaleKeys.articlesSideEffects.tr(),
              onTap: () {
                NavigationManager.push(SideEffectScreen.id);
              },
            ),
            const SizedBox(),
            FeatureHomeWidget(
              imagePath: AppImages.adviceHomeImage,
              title: LocaleKeys.tipsBeforeAfterVaccination.tr(),
              onTap: () {
                NavigationManager.push(VaccinationTipsScreen.id);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            FeatureHomeWidget(
              imagePath: AppImages.articleGeneralImage,
              title: LocaleKeys.generalArticlesVaccinations.tr(),
              onTap: () {
                NavigationManager.push(VaccineInfoScreen.id);
              },
            ),
            const SizedBox(),
            FeatureHomeWidget(
              imagePath: AppImages.databasePharmaceuticalImage,
              title: LocaleKeys.medicationDatabase.tr(),
              onTap: () {
                NavigationManager.push(MedicinesScreen.id);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
