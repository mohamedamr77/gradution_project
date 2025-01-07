import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/features/vaccination_tips/presentation/view/widgets/vaccination_tips_screen.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text.dart';
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
              title: AppText.articlesSideEffects,
              onTap: () {},
            ),
            const SizedBox(),
            FeatureHomeWidget(
              imagePath: AppImages.adviceHomeImage,
              title: AppText.tipsBeforeAfterVaccination,
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
              title: AppText.generalArticlesVaccinations,
              onTap: () {},
            ),
            const SizedBox(),
            const FeatureHomeWidget(
              imagePath: AppImages.databasePharmaceuticalImage,
              title: AppText.medicationDatabase,
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
