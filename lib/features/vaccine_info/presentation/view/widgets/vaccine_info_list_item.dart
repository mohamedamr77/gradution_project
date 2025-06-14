import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_model/resuable_model.dart';
import 'package:gradutionproject/features/side_effects/presentation/view_model/article/article_cubit.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/viewModel/vaccine_info_cubit.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/viewModel/vaccine_info_state.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/utils/locale_keys.g.dart';

import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../side_effects/data/model/article/artcile_model.dart';
import '../vaccine_info_details_screen.dart';

class VaccineInfoListItem extends StatelessWidget {
  const VaccineInfoListItem({super.key});

  @override
  Widget build(BuildContext context) {
    VaccineInfoCubit cubit = BlocProvider.of<VaccineInfoCubit>(context);
    final  articleCubit = BlocProvider.of<ArticleCubit>(context);
    return BlocBuilder<VaccineInfoCubit, VaccineInfoState>(
      builder: (context, state) {
        return SliverList.separated(
          itemCount: cubit.buttonSelected == 0
              ? articleCubit.articlesFeature?.length ?? 0
              : articleCubit.articlesNotFeature?.length ?? 0,
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
                    ? basicButtonList(articleModel: articleCubit.articlesFeature?[index]?? const ArticleModel())
                    : additionalButtonList(articleModel: articleCubit.articlesNotFeature?[index]?? const ArticleModel()));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 8);
          },
        );
      },
    );
  }

  Widget basicButtonList({required ArticleModel articleModel}) {
    return ReusableItemCard(
      key: const ValueKey<int>(0),
      reusableModel: ReusableModel(
        imagePath: articleModel.image ?? "https://th.bing.com/th/id/R.8f829da9a5e99e16cdf785b35721d484?rik=DXgAfHOQWSFbVw&pid=ImgRaw&r=0",
        title: articleModel.title?? LocaleKeys.unAvailable.tr(),
        description: articleModel.status?? LocaleKeys.unAvailable.tr(),
        subDescription: articleModel.author?[0]??"",
        onPressedIconFavourite: () {},
        onTapCard: () {
          NavigationManager.push(VaccineInfoDetailsScreen.id);
        },
      ), // Assign a unique key for animation
    );
  }

  Widget additionalButtonList({required ArticleModel articleModel}) {
    return ReusableItemCard(
      key: const ValueKey<int>(1),
      reusableModel: ReusableModel(
        imagePath: articleModel.image ?? "https://th.bing.com/th/id/R.8f829da9a5e99e16cdf785b35721d484?rik=DXgAfHOQWSFbVw&pid=ImgRaw&r=0",
        title: articleModel.title?? LocaleKeys.unAvailable.tr(),
        description: articleModel.status?? LocaleKeys.unAvailable.tr(),
        subDescription: articleModel.author?[0]??"",
        onPressedIconFavourite: () {},
        onTapCard: () {
          NavigationManager.push(VaccineInfoDetailsScreen.id);
        },
      ), // Assign a unique key for animation
    );
  }
}
