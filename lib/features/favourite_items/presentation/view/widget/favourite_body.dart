import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/favourite_items/presentation/viewModel/favouite_item_state.dart';
import '../../viewModel/favourite_items_cubit.dart';
import 'fav_horizontal_buttons.dart';
import 'fav_list_items.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FavouriteItemsCubit>(context);
    return BlocBuilder<FavouriteItemsCubit, FavouriteItemsState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
          child: CustomScrollView(
            slivers: [
              FavHorizontalButtons(
                cubit: cubit,
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              FavListItems(
                cubit: cubit,
              ),
            ],
          ),
        );
      },
    );
  }
}
