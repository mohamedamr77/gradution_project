import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/features/medicines/presentation/view/widgets/details/medicines_details_body.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicine_by_id/medicine_by_id_cubit.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/locale_keys.g.dart';
import '../../data/repo/medicines_repo_impl.dart';

class MedicinesDetailsScreen extends StatelessWidget {
  static String id = "MedicinesDetailsScreen";
  const MedicinesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final medicineId = args['MedicineId'] as String;
    return  BlocProvider(
  create: (context) => MedicineByIdCubit(medicinesRepo: MedicinesRepoImpl(apiService: ApiService())),
  child: Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.recommendedMedications.tr(),
      ),
      body:  MedicinesDetailsBody(medicineId: medicineId,),
    ),
);
  }
}
