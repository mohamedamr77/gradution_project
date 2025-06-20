import 'package:flutter/material.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/view/widgets/details/vaccine_times_deatils_body.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/locale_keys.g.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';

class VaccineTimesDetailsScreen extends StatelessWidget {
  static String id = "VaccineTimesDetailsScreen";
  const VaccineTimesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final vaccineId = args['vaccineId'] as String;
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.vaccineDetails.tr(),
      ),
      body:  VaccineTimesDetailsBody(id: vaccineId,),
    );
  }
}
