import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import 'package:gradutionproject/features/medicines/data/repo/medicines_repo_impl.dart';
import 'package:gradutionproject/features/medicines/presentation/view/widgets/medicines_body.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicines_cubit.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_icons.dart';

class MedicinesScreen extends StatelessWidget {
  static String id = "MedicinesScreen";
  const MedicinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicinesCubit(medicinesRepo: MedicinesRepoImpl(apiService: ApiService()))..getAllMedicines(search: ''),
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.recommendedMedications.tr(),
        ),
        body: const MedicinesBody(),
      ),
    );
  }
}
