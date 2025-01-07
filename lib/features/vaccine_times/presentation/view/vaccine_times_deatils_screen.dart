import 'package:flutter/material.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/view/widgets/details/vaccine_times_deatils_body.dart';

import '../../../../core/navigation/navigation_manager.dart';
import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_text.dart';

class VaccineTimesDetailsScreen extends StatelessWidget {
  static String id = "VaccineTimesDetailsScreen";
  const VaccineTimesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: AppText.vaccineDetails,
        onBackPressed: () {
        NavigationManager.goBack();
      },),
      body: const VaccineTimesDetailsBody(),
    );
  }
}
