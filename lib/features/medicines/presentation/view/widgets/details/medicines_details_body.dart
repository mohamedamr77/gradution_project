import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicine_by_id/medicine_by_id_cubit.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicine_by_id/medicine_by_id_state.dart';

import '../../../../../../core/shared_widget/custom_title_text.dart';
import '../../../../../../core/shared_widget/global_text.dart';
import '../../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/locale_keys.g.dart';
import '../../../../../../core/shared_model/resuable_model.dart';
import 'medicine_by_id_success_body.dart';

class MedicinesDetailsBody extends StatefulWidget {
  final String medicineId;

  const MedicinesDetailsBody({super.key, required this.medicineId});

  @override
  State<MedicinesDetailsBody> createState() => _MedicinesDetailsBodyState();
}

class _MedicinesDetailsBodyState extends State<MedicinesDetailsBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MedicineByIdCubit>(context)
        .getMedicineById(id: widget.medicineId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineByIdCubit, MedicineByIdState>(
      builder: (context, state) {
        if (state is MedicineByIdLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MedicineByIdSuccessState) {
          debugPrint(
              "MedicineByIdSuccessState: ${state.medication.name}");
          return MedicineByIdSuccessBody(
            medicationModel: state.medication,
          );

        } else if (state is MedicineByIdErrorState) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
