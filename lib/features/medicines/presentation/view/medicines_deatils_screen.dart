import 'package:flutter/material.dart';
import 'package:gradutionproject/features/medicines/presentation/view/widgets/details/medicines_details_body.dart';

import '../../../../core/navigation/navigation_manager.dart';
import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_text.dart';

class MedicinesDetailsScreen extends StatelessWidget {
  static String id ="MedicinesDetailsScreen";
  const MedicinesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppText.recommendedMedications,
        onBackPressed: () {
          NavigationManager.goBack();
        },),
      body: const MedicinesDetailsBody(),
    );
  }
}
