import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/favourite_items/presentation/viewModel/favouite_item_state.dart';
import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../viewModel/favourite_items_cubit.dart';
import '../../../../../core/shared_widget/reusable_item_card .dart';

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
                const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 16,
                )),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(buttonFavouriteTitles.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                                onTap: () {
                                  cubit.selectButton(index);
                                },
                                child: Container(
                                  width: 0.42.w,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12),
                                  decoration: BoxDecoration(
                                    color: index == cubit.buttonSelected ?
                                    AppColors.primaryColor :
                                    AppColors.secondaryColor,
                                      border: Border.all(
                                          color:
                                          AppColors.primaryColor),
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                  child:  Center(
                                    child: GText(
                                      color: index == cubit.buttonSelected ? AppColors.whiteColor : AppColors.primaryColor,
                                      content: buttonFavouriteTitles[index],
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
                const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 16,
                )),
                SliverList.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ReusableItemCard(
                      imagePath: AppImages.tuberVaccineTest,
                      title: AppText.sideEffectsTuberculosisVaccine,
                      description: "فعال بنسبة99%",
                      subDescription: "يتم اخده مره واحده",
                      onPressedIconFavourite: () {},
                      onTapCard: () {},
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
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


List<String> buttonFavouriteTitles=[
  AppText.articles,
  AppText.doctors,

];

/*
index == cubit.buttonSelected
                                    ? ButtonService.activeButton(
                                        title: AppText.articles)
                                    : ButtonService.inactiveButton(
                                        title: AppText.doctors)
 */