import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/locale_keys.g.dart';

class HeightFieldChildInfo extends StatelessWidget {
  const HeightFieldChildInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomTextField(
          hintText: LocaleKeys.height.tr(), title: LocaleKeys.height.tr()),
    );
  }
}
