import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gradutionproject/features/doctors/presentation/view/widgets/details/doctor_details_body.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/locale_keys.g.dart';

class DoctorDetailsScreen extends StatelessWidget {
  static String id = "DoctorDetailsScreen";
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.doctorInfo.tr(),
      ),
      body: const DoctorDetailsBody(),
    );
  }
}
