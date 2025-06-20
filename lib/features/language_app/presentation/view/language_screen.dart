import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gradutionproject/features/language_app/presentation/view/widgets/language_body.dart';
import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/locale_keys.g.dart';

class LanguageScreen extends StatelessWidget {
  static String id = "language_screen";

  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.language.tr(),
      ),
      body: const LanguageBody(),
    );
  }
}
