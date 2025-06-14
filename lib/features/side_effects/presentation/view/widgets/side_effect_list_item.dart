import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import 'package:gradutionproject/features/side_effects/data/model/article/artcile_model.dart';
import 'package:gradutionproject/features/side_effects/presentation/view_model/article/article_state.dart';
import 'package:gradutionproject/features/side_effects/presentation/view_model/side_effects_cubit.dart';
import 'package:gradutionproject/features/side_effects/presentation/view_model/side_effects_state.dart';

import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/shared_model/resuable_model.dart';
import '../../../data/model/side_effect_list.dart';
import '../../view_model/article/article_cubit.dart';

class SideEffectListItem extends StatelessWidget {
  const SideEffectListItem({super.key,});

  @override
  Widget build(BuildContext context) {
    SideEffectsCubit cubit = BlocProvider.of<SideEffectsCubit>(context);
    final articleCubit = BlocProvider.of<ArticleCubit>(context);
    return BlocBuilder<SideEffectsCubit, SideEffectsState>(
      builder: (context, state) {
        return SliverList.separated(
          itemCount:
          cubit.buttonSelected == 0
              ?
         articleCubit.articlesSideEffectFeature?.length ??0: articleCubit.articlesSideEffectNotFeature?.length ??0,
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
                    ? _buildBasicButtonList(index: index, articleModel:articleCubit.articlesSideEffectFeature?[index] ??const ArticleModel())
                    : _buildAdditionalButtonList(index: index, articleModel:articleCubit.articlesSideEffectNotFeature?[index] ??const ArticleModel()));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 8);
          },
        );
      },
    );
  }

  Widget _buildBasicButtonList({ required int index,required ArticleModel articleModel}) {
    return ReusableItemCard(
      key: ValueKey<int>(index),
      reusableModel: ReusableModel(
        imagePath: articleModel.image ?? "https://th.bing.com/th/id/R.8f829da9a5e99e16cdf785b35721d484?rik=DXgAfHOQWSFbVw&pid=ImgRaw&r=0",
        title: articleModel.title?? LocaleKeys.unAvailable.tr(),
        description: articleModel.status?? LocaleKeys.unAvailable.tr(),
        subDescription: articleModel.author?[0]??"",

        onPressedIconFavourite: () {},
        onTapCard: () {
          NavigationManager.push('side_effect_details_screen');
        },
      ),
    );
  }

  Widget _buildAdditionalButtonList({ required int index,required ArticleModel articleModel}) {

    return ReusableItemCard(
      key: ValueKey<int>(index),
      reusableModel: ReusableModel(
        imagePath: articleModel.image ?? "https://th.bing.com/th/id/R.8f829da9a5e99e16cdf785b35721d484?rik=DXgAfHOQWSFbVw&pid=ImgRaw&r=0",
        title: articleModel.title?? LocaleKeys.unAvailable.tr(),
        description: articleModel.status?? LocaleKeys.unAvailable.tr(),
        subDescription: articleModel.author?[0]??"",
        onPressedIconFavourite: () {},
        onTapCard: () {
          NavigationManager.push('side_effect_details_screen');
        },
      ),
    );
  }
}
/*
/*
    imagePath: medicationModel.image ?? AppImages.tuberVaccineTest,
        title: medicationModel.name ?? "غير متاح",
        description: medicationModel.description ?? "غير متاح",
        subDescription: medicationModel.dosage ??"غير متاح",
 */
 */