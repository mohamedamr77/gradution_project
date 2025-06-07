import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/features/side_effects/presentation/view_model/side_effects_cubit.dart';
import 'package:gradutionproject/features/side_effects/presentation/view_model/side_effects_state.dart';

import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/shared_model/resuable_model.dart';
import '../../../data/model/side_effect_list.dart';

class SideEffectListItem extends StatelessWidget {
  const SideEffectListItem({super.key});

  @override
  Widget build(BuildContext context) {
    SideEffectsCubit cubit = BlocProvider.of<SideEffectsCubit>(context);
    return BlocBuilder<SideEffectsCubit, SideEffectsState>(
      builder: (context, state) {
        return SliverList.separated(
          itemCount: sideEffectList.length,
          itemBuilder: (context, index) {
            return AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor: animation,
                      axis: Axis.vertical,
                      child: child,
                    ),
                  );
                },
                child: cubit.buttonSelected == 0
                    ? _buildBasicButtonList(index)
                    : _buildAdditionalButtonList(index));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 8);
          },
        );
      },
    );
  }

  Widget _buildBasicButtonList(int index) {
    return ReusableItemCard(
      key: ValueKey<int>(index),
      reusableModel: ReusableModel(
        imagePath: AppImages.tuberVaccineTest,
        title: sideEffectList[index],
        description: "فعال بنسبة99%",
        subDescription: "يتم اخده مره واحده",
        onPressedIconFavourite: () {},
        onTapCard: () {
          NavigationManager.push('side_effect_details_screen');
        },
      ),
    );
  }

  Widget _buildAdditionalButtonList(int index) {
    return ReusableItemCard(
      key: ValueKey<int>(index),
      reusableModel: ReusableModel(
        imagePath: AppImages.vaccine4Test,
        title: sideEffectList[index],
        description: "فعال بنسبة99%",
        subDescription: "يتم اخده مره واحده",
        onPressedIconFavourite: () {},
        onTapCard: () {
          NavigationManager.push('side_effect_details_screen');
        },
      ),
    );
  }
}
