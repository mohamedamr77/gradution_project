import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/features/vaccination_tips/presentation/viewModel/vaccination_tips_state.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/article/data/model/article/artcile_model.dart';
import '../../../../../core/article/presentation/view/article_by_id/article_details_by_id_screen.dart';
import '../../../../../core/article/presentation/view_model/article/article_cubit.dart';
import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/shared_model/resuable_model.dart';
import '../../viewModel/vaccination_tips_cubit.dart';
import '../vaccine_tips_details_screen.dart';
import '../../../../../core/utils/locale_keys.g.dart';

class VaccinationTipsListItem extends StatelessWidget {
  const VaccinationTipsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    VaccinationTipsCubit cubit = BlocProvider.of<VaccinationTipsCubit>(context);
    final articleCubit = BlocProvider.of<ArticleCubit>(context);
    return BlocBuilder<VaccinationTipsCubit, VaccinationTipsState>(
      builder: (context, state) {
        return SliverList.separated(
          itemCount: cubit.buttonSelected == 0
              ? articleCubit.articleBeforeAndAfterVaccinationFeature?.length ??0  :
               articleCubit.articleBeforeAndAfterVaccinationNotFeature?.length ??0,
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
                    ? basicButtonList(articleModel: articleCubit.articleBeforeAndAfterVaccinationFeature?[index] ??const ArticleModel())
                    : additionalButtonList(articleModel: articleCubit.articleBeforeAndAfterVaccinationNotFeature?[index]??const ArticleModel()));
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
      key: const ValueKey<int>(0), // Assign a unique key for animation
      reusableModel: ReusableModel(
        imagePath: articleModel.image ?? "https://th.bing.com/th/id/R.8f829da9a5e99e16cdf785b35721d484?rik=DXgAfHOQWSFbVw&pid=ImgRaw&r=0",
        title: articleModel.title?? LocaleKeys.unAvailable.tr(),
        description: articleModel.status?? LocaleKeys.unAvailable.tr(),
        subDescription: articleModel.author?[0]??"",
        onPressedIconFavourite: () {},
        onTapCard: () {
          NavigationManager.push(ArticleDetailsById.id,
              arguments: {
                'articleId': articleModel.id,
              }
          );
        },
      ),
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
          NavigationManager.push(ArticleDetailsById.id,
              arguments: {
                'articleId': articleModel.id,
              }
          );
        },
      ), // Assign a unique key for animation
    );
  }
}
