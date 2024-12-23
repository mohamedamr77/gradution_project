import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_text.dart';

class NameFieldChildInfo extends StatelessWidget {
  const NameFieldChildInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SliverToBoxAdapter(
      child: CustomTextField(
          hintText: AppText.enterYourName,
          prefix: AppIcons.nameIcon,
          title: AppText.name),
    );
  }
}
