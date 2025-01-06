import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/favourite_items/presentation/viewModel/favouite_item_state.dart';

import '../../viewModel/favourite_items_cubit.dart';

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
                  child: SizedBox(
                    child: SingleChildScrollView(
                        scrollDirection:
                            Axis.horizontal, // Enable horizontal scrolling
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              2, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8),
                              child: GestureDetector(
                                  onTap: () {
                                    cubit.selectButton(index);
                                  },
                                  child: index == cubit.buttonSelected
                                      ? activeButton(title: AppText.articles)
                                      : inactiveButton(title: AppText.doctors)),
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
                    return Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.secondaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                  image: const AssetImage(AppImages.tuberVaccineTest),
                                  width: 0.28.w,
                                  height: 0.12.h,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 0.5.w,
                                    child: const GText(
                                      color: AppColors.blackColor,
                                      content:
                                      AppText.sideEffectsTuberculosisVaccine,
                                      fontSize: 16,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    ),
                                    const SizedBox(height: 8,),
                                    SizedBox(
                                      width: 0.5.w,
                                    child: const GText(
                                      color: AppColors.primaryColor,
                                      content:
                                     "فعال بنسبة99%",
                                      fontSize: 14,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    ),
                                    const SizedBox(height: 4,),
                                   const GText(
                                     textAlign: TextAlign.right,
                                     color: AppColors.grayColor1,
                                     content:
                                     "يتم اخده مره واحده",
                                     fontSize: 14,
                                     maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                     fontWeight: FontWeight.w400,
                                   )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite,color: AppColors.primaryColor,),
                        ),
                        Positioned(
                          bottom: -8,
                          left: 8,
                          child: TextButton(onPressed: () {

                          }, child: GText(color: AppColors.primaryColor, content: AppText.knowMore, fontSize: 12)),
                        )
                      ],
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

  Widget activeButton({required String title}){
    return Container(
      width: 0.42.w,
      padding: const EdgeInsets.symmetric(
          vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius:
        BorderRadius.circular(20),
      ),
      child:  Center(
        child: GText(
          color: AppColors.whiteColor,
          content: title,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
  
  Widget inactiveButton({required String title}){
    return  Container(
      width: 0.42.w,
      padding: const EdgeInsets.symmetric(
          vertical: 12),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius:
          BorderRadius.circular(20),
          border: Border.all(
              color:
              AppColors.primaryColor)),
      child:  Center(
        child: GText(
          color: AppColors.primaryColor,
          content: title,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
