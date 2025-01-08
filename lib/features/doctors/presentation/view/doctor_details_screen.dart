import 'package:flutter/material.dart';
import 'package:gradutionproject/features/doctors/presentation/view/widgets/details/doctor_details_body.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_text.dart';

class DoctorDetailsScreen extends StatelessWidget {
  static String id = "DoctorDetailsScreen";
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: AppText.doctorInfo,
      ),
      body: DoctorDetailsBody(),
    );
  }
}
