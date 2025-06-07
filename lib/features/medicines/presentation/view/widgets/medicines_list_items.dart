import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicines_state.dart';

import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text.dart';
import '../../../../../core/shared_model/resuable_model.dart';
import '../../../data/model/medication_model.dart';
import '../../viewModel/medicines_cubit.dart';
import '../medicines_deatils_screen.dart';

class MedicinesListItems extends StatelessWidget {
  final  List<MedicationModel> medications;
  const MedicinesListItems({super.key, required this.medications});

  @override
  Widget build(BuildContext context) {
    MedicinesCubit cubit = BlocProvider.of<MedicinesCubit>(context);
    return BlocBuilder<MedicinesCubit, MedicinesState>(
      builder: (context, state) {
        return SliverList.separated(
          itemCount: medications.length,
          itemBuilder: (context, index) {
            return AnimatedSwitcher(
                duration:
                    const Duration(milliseconds: 400), // Animation duration
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor:
                          animation,
                      axis: Axis.vertical, // Controls the resizing direction
                      child: child,
                    ),
                  );
                },
                child: basicButtonList(medicationModel: medications[index]),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 8);
          },
        );
      },
    );
  }

  Widget basicButtonList({required MedicationModel medicationModel}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ReusableItemCard(
        key: const ValueKey<int>(0),
        reusableModel: ReusableModel(
          imagePath: medicationModel.image ?? AppImages.tuberVaccineTest,
          title: medicationModel.name ?? "غير متاح",
          description: medicationModel.description ?? "غير متاح",
          subDescription: medicationModel.dosage ??"غير متاح",
          onPressedIconFavourite: () {},
          onTapCard: () {
            NavigationManager.push(MedicinesDetailsScreen.id);
          },
        ), // Assign a unique key for animation
      ),
    );
  }

}
