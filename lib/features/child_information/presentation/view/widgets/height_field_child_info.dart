import 'package:flutter/material.dart';
import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_text.dart';
class HeightFieldChildInfo extends StatelessWidget {
  const HeightFieldChildInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: CustomTextField(
          hintText: AppText.height, title: AppText.height),
    );
  }
}
