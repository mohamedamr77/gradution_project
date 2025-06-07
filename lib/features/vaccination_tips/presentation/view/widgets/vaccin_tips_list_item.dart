import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/features/vaccination_tips/presentation/viewModel/vaccination_tips_state.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/shared_model/resuable_model.dart';
import '../../viewModel/vaccination_tips_cubit.dart';
import '../vaccine_tips_details_screen.dart';
import '../../../../../core/utils/locale_keys.g.dart';

class VaccinationTipsListItem extends StatelessWidget {
  const VaccinationTipsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    VaccinationTipsCubit cubit = BlocProvider.of<VaccinationTipsCubit>(context);
    return BlocBuilder<VaccinationTipsCubit, VaccinationTipsState>(
      builder: (context, state) {
        return SliverList.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return AnimatedSwitcher(
                duration:
                    const Duration(milliseconds: 400), // Animation duration
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor:
                          animation, // Resizes the widget during the transition
                      axis: Axis.vertical, // Controls the resizing direction
                      child: child,
                    ),
                  );
                },
                child: cubit.buttonSelected == 0
                    ? basicButtonList()
                    : additionalButtonList());
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 8);
          },
        );
      },
    );
  }

  Widget basicButtonList() {
    return ReusableItemCard(
      key: const ValueKey<int>(0), // Assign a unique key for animation
      reusableModel: ReusableModel(
        imagePath: AppImages.tuberVaccineTest,
        title: LocaleKeys.rotavirusVaccine.tr(),
        description: "فعال بنسبة99%",
        subDescription: "يتم اخده مره واحده",
        onPressedIconFavourite: () {},
        onTapCard: () {
          NavigationManager.push(VaccineTipsDetailsScreen.id);
        },
      ),
    );
  }

  Widget additionalButtonList() {
    return ReusableItemCard(
      key: const ValueKey<int>(1),
      reusableModel: ReusableModel(
        imagePath: AppImages.vaccine4Test,
        title: "تطعيم الدرن",
        description: "فعال بنسبة99%",
        subDescription: "يتم اخده مره واحده",
        onPressedIconFavourite: () {},
        onTapCard: () {
          NavigationManager.push(VaccineTipsDetailsScreen.id);
        },
      ), // Assign a unique key for animation
    );
  }
}
