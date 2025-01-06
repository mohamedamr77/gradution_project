import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text.dart';
import '../../viewModel/favourite_items_cubit.dart';

class FavListItems extends StatelessWidget {
  final FavouriteItemsCubit cubit;
  const FavListItems({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400), // Animation duration
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation, // Resizes the widget during the transition
                axis: Axis.vertical, // Controls the resizing direction
                child: child,
              ),
            );
          },
          child: cubit.buttonSelected == 0
              ? ReusableItemCard(
            key: const ValueKey<int>(0), // Assign a unique key for animation
            imagePath: AppImages.tuberVaccineTest,
            title: AppText.sideEffectsTuberculosisVaccine,
            description: "فعال بنسبة99%",
            subDescription: "يتم اخده مره واحده",
            onPressedIconFavourite: () {},
            onTapCard: () {},
          )
              : Container(
            key: const ValueKey<int>(1), // Assign a unique key for animation
            height: 200,
            width: double.infinity,
            color: Colors.redAccent,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
    );
  }
}


/*
class FavListItems extends StatelessWidget {
  final FavouriteItemsCubit cubit;
  const FavListItems({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300), // Animation duration
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.2), // Start slightly below
                  end: Offset.zero, // End at the original position
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: cubit.buttonSelected == 0
              ? ReusableItemCard(
                  key: const ValueKey<int>(0), // Assign a unique key for animation
                  imagePath: AppImages.tuberVaccineTest,
                  title: AppText.sideEffectsTuberculosisVaccine,
                  description: "فعال بنسبة99%",
                  subDescription: "يتم اخده مره واحده",
                  onPressedIconFavourite: () {},
                  onTapCard: () {},
                )
              : Container(
                  key: const ValueKey<int>(1), // Assign a unique key for animation
                  height: 200,
                  width: double.infinity,
                  color: Colors.redAccent,
                ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
    );
  }
}

 */