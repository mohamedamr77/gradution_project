import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gradutionproject/features/medicines/presentation/view/widgets/details/medicines_details_body.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_text.dart';
import '../../../../core/utils/locale_keys.g.dart';

class MedicinesDetailsScreen extends StatelessWidget {
  static String id = "MedicinesDetailsScreen";
  const MedicinesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.recommendedMedications.tr(),
      ),
      body: MedicinesDetailsBody(),
    );
  }
}
