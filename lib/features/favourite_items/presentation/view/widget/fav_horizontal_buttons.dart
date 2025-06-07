import 'package:flutter/material.dart';
import 'package:gradutionproject/features/favourite_items/data/model/button_fav_list.dart';
import 'package:gradutionproject/features/favourite_items/presentation/viewModel/favourite_items_cubit.dart';

import '../../../../../core/shared_widget/button_list_horizontal.dart';

class FavHorizontalButtons extends StatelessWidget {
  final FavouriteItemsCubit cubit;
  const FavHorizontalButtons({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(buttonFavouriteTitles.length, (index) {
            return ButtonListHorizontal(
              onTap: () => cubit.selectButton(index),
              buttonNames: buttonFavouriteTitles,
              index: index,
              buttonSelectedIndex: cubit.buttonSelected,
            );
          }),
        ),
      ),
    );
  }
}
