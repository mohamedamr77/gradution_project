import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/shared_model/resuable_model.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/viewModel/vaccine_cubit/vaccine_cubit.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/viewModel/vaccine_cubit/vaccine_state.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/viewModel/vaccine_times_state.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/navigation/navigation_manager.dart';
import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/locale_keys.g.dart';
import '../../../data/model/vaccine/vaccine_model.dart';
import '../../viewModel/vaccine_times_cubit.dart';
import '../vaccine_times_deatils_screen.dart';

class VaccineTimesListItems extends StatelessWidget {

  const VaccineTimesListItems({super.key});

  @override
  Widget build(BuildContext context) {
    VaccineTimesCubit vaccineTimesCubit = BlocProvider.of<VaccineTimesCubit>(context);
    VaccineCubit vaccineCubit = BlocProvider.of<VaccineCubit>(context);
    return BlocBuilder<VaccineCubit, VaccineState>(
      builder: (context, state) {
        return BlocBuilder<VaccineTimesCubit, VaccineTimesState>(
          builder: (context, state) {
            return SliverList.separated(
              itemCount:
              vaccineTimesCubit.buttonSelected == 0
                  ?
              vaccineCubit.vaccineListBasic?.length ??0:
              vaccineCubit.vaccineListAdditional?.length ??0,
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
                          axis: Axis.vertical,
                          child: child,
                        ),
                      );
                    },
                    child: vaccineTimesCubit.buttonSelected == 0
                        ? basicButtonList(vaccineModel: vaccineCubit.vaccineListBasic?[index]??const VaccineModel())
                        : additionalButtonList(vaccineModel:  vaccineCubit.vaccineListAdditional?[index]??const VaccineModel()));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8);
              },
            );
          },
        );
      },
    );
  }

  Widget additionalButtonList({required VaccineModel vaccineModel}) {
    return ReusableItemCard(
      key: const ValueKey<int>(1),
      reusableModel: ReusableModel(
        imagePath: AppImages.vaccine4Test,
        title: vaccineModel.vaccineName??"",
        description: vaccineModel.description??"",
        subDescription: "doses required :${vaccineModel.dosesRequired??0}",
        onTapCheckBoxVaccineTimes: () {
          debugPrint('Mohamed amr');
        },
        onTapCard: () {
          NavigationManager.push(VaccineTimesDetailsScreen.id,
          arguments: {
            'vaccineId': vaccineModel.vaccineId.toString() ??"",
          }
          );
        },
        isVaccineTimes: true,
        isCheckBoxTrue: true,
      ), // Assign a unique key for animation
    );
  }

  Widget basicButtonList({required VaccineModel vaccineModel}) {
    return ReusableItemCard(
      key: const ValueKey<int>(0), // Assign a unique key for animation
      reusableModel: ReusableModel(
        imagePath: AppImages.tuberVaccineTest,

        title: vaccineModel.vaccineName??"",
        description: vaccineModel.description??"",
        subDescription: "doses required :${vaccineModel.dosesRequired??0}",
        onPressedIconFavourite: () {},
        onTapCheckBoxVaccineTimes: () {},
        isVaccineTimes: true,
        onTapCard: () {
          NavigationManager.push(VaccineTimesDetailsScreen.id,
          arguments: {
            "vaccineId" :vaccineModel.vaccineId.toString()??"",
          }
          );
        },
      ),
    );
  }
}
