import 'package:flutter/material.dart';
import 'package:gradutionproject/features/side_effects/presentation/view/widgets/details/side_effect_details_body.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_text.dart';

class SideEffectDetailsScreen extends StatelessWidget {
  static String id = "side_effect_details_screen";
  const SideEffectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: AppText.articlesSideEffects,
      ),
      body: SideEffectDetailsBody(),
    );
  }
}
