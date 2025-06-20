import 'package:flutter/material.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/view/widgets/details/vaccine_info_details_body.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/locale_keys.g.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';

class VaccineInfoDetailsScreen extends StatelessWidget {
  static String id = "VaccineInfoDetailsScreen";
  const VaccineInfoDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.generalArticlesVaccinations.tr(),
      ),
      body: const VaccineInfoDetailsBody(),
    );
  }
}
