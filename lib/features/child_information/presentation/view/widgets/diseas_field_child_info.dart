import 'package:flutter/material.dart';
import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_text.dart';
class DiseasesFieldChildInfo extends StatelessWidget {
  const DiseasesFieldChildInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SliverToBoxAdapter(
      child: CustomTextField(
          hintText: ".............", title: AppText.childDiseases),
    );
  }
}
