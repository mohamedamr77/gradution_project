import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/features/side_effects/presentation/view/side_effect_details_screen.dart';
import 'package:gradutionproject/features/side_effects/presentation/view_model/side_effects_cubit.dart';
import 'package:gradutionproject/features/side_effects/presentation/view_model/side_effects_state.dart';
import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text.dart';
import '../../../../../core/shared_model/resuable_model.dart';

class SideEffectsListItem extends StatelessWidget {
  const SideEffectsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    SideEffectsCubit cubit = BlocProvider.of<SideEffectsCubit>(context);
    return BlocBuilder<SideEffectsCubit, SideEffectsState>(
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
        key: const ValueKey<int>(0),
        reusableModel: ReusableModel(
          imagePath: AppImages.tuberVaccineTest,
          title: AppText.rotavirusVaccine,
          description: "فعال بنسبة99%",
          subDescription: "يتم اخده مره واحده",
          onPressedIconFavourite: () {},
          onTapCard: () {
            NavigationManager.push(SideEffectDetailsScreen.id);
          },
        ) // Assign a unique key for animation

        );
  }

  Widget additionalButtonList() {
    return ReusableItemCard(
      key: const ValueKey<int>(1), // Assign a unique key for animation
      reusableModel: ReusableModel(
        imagePath: AppImages.vaccine4Test,
        title: "تطعيم الدرن",
        description: "فعال بنسبة99%",
        subDescription: "يتم اخده مره واحده",
        onPressedIconFavourite: () {},
        onTapCard: () {
          NavigationManager.push(SideEffectDetailsScreen.id);
        },
      ),
    );
  }
}
