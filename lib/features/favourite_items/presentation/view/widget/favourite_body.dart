import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/favourite_items/presentation/viewModel/favouite_item_state.dart';

import '../../viewModel/favourite_items_cubit.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit =BlocProvider.of<FavouriteItemsCubit>(context);
    return BlocBuilder<FavouriteItemsCubit, FavouriteItemsState>(
      builder: (context, state) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    )),
                SliverToBoxAdapter(
                  child: SizedBox(
                    child: SingleChildScrollView(
                        scrollDirection:
                        Axis.horizontal, // Enable horizontal scrolling
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(2, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8), // Add padding between items
                              child: GestureDetector(
                                onTap: () {
                                  cubit.selectButton(index);
                                },
                                child:
                                index ==cubit.buttonSelected?
                                Container(
                                  width: 0.42.w,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: GText(
                                      color: AppColors.whiteColor,
                                      content: AppText.doctors,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ) :
                                Container(
                                  width: 0.42.w,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: AppColors.primaryColor
                                    )
                                  ),
                                  child: const Center(
                                    child: GText(
                                      color: AppColors.primaryColor,
                                      content: AppText.doctors,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ),
                            );
                          }),
                        )),
                  ),
                ),
                const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    )),
                SliverList.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.redAccent,
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 8,
                  );
                },
                )
              ],
            ));
      },
    );
  }
}
