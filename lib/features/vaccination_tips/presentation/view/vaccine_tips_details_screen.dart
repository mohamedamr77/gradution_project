import 'package:flutter/material.dart';
import 'package:gradutionproject/features/vaccination_tips/presentation/view/widgets/vaccin_tips_details/vaccine_tips_details_body.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_text.dart';

class VaccineTipsDetailsScreen extends StatelessWidget {
  static String id = "TipsDetailsScreen";
  const VaccineTipsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: AppText.tipsBeforeAfterVaccination,
      ),
      body: VaccineTipsDetailsBody(),
    );
  }
}
