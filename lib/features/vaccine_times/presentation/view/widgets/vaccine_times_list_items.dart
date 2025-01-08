import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/shared_model/resuable_model.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/viewModel/vaccine_times_state.dart';

import '../../../../../core/navigation/navigation_manager.dart';
import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text.dart';
import '../../viewModel/vaccine_times_cubit.dart';
import '../vaccine_times_deatils_screen.dart';

class VaccineTimesListItems extends StatelessWidget {
  const VaccineTimesListItems({super.key});

  @override
  Widget build(BuildContext context) {
    VaccineTimesCubit cubit = BlocProvider.of<VaccineTimesCubit>(context);
    return BlocBuilder<VaccineTimesCubit, VaccineTimesState>(
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

  Widget additionalButtonList() {
    return ReusableItemCard(
      key: const ValueKey<int>(1),
      reusableModel: ReusableModel(
        imagePath: AppImages.vaccine4Test,
        title: "تطعيم الدرن",
        description: "فعال بنسبة99%",
        subDescription: "يتم اخده مره واحده",
        onTapCheckBoxVaccineTimes: () {
          debugPrint('Mohamed amr');
        },
        onTapCard: () {
          NavigationManager.push(VaccineTimesDetailsScreen.id);
        },
        isVaccineTimes: true,
        isCheckBoxTrue: true,
      ), // Assign a unique key for animation

    );
  }

  Widget basicButtonList() {
    return ReusableItemCard(
      key: const ValueKey<int>(0), // Assign a unique key for animation
       reusableModel: ReusableModel(
         imagePath: AppImages.tuberVaccineTest,
         title: AppText.rotavirusVaccine,
         description: "فعال بنسبة99%",
         subDescription: "يتم اخده مره واحده",
         onPressedIconFavourite: () {},
         onTapCheckBoxVaccineTimes: () {},
         isVaccineTimes: true,
         onTapCard: () {
           NavigationManager.push(VaccineTimesDetailsScreen.id);
         },
       ),
    );
  }
}
