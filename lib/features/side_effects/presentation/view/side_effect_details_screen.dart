import 'package:flutter/material.dart';
import 'package:gradutionproject/features/side_effects/presentation/view/widgets/details/side_effect_details_body.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/locale_keys.g.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';

class SideEffectDetailsScreen extends StatelessWidget {
  static String id = "side_effect_details_screen";
  const SideEffectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.articlesSideEffects.tr(),
      ),
      body: const SideEffectDetailsBody(),
    );
  }
}
