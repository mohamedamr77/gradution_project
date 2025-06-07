import 'package:flutter/material.dart';
import 'package:gradutionproject/features/vaccination_tips/presentation/view/widgets/vaccin_tips_details/vaccine_tips_details_body.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/locale_keys.g.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';

class VaccineTipsDetailsScreen extends StatelessWidget {
  static String id = "TipsDetailsScreen";
  const VaccineTipsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.tipsBeforeAfterVaccination.tr(),
      ),
      body: const VaccineTipsDetailsBody(),
    );
  }
}
