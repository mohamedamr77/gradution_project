import 'package:flutter/material.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/view/widgets/details/vaccine_info_details_body.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_text.dart';

class VaccineInfoDetailsScreen extends StatelessWidget {
  static String id = "VaccineInfoDetailsScreen";
  const VaccineInfoDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: AppText.generalArticlesVaccinations,
      ),
      body: VaccineInfoDetailsBody(),
    );
  }
}
