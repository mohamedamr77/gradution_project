import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/article/data/model/dummy_articles.dart';
import 'package:gradutionproject/core/article/presentation/view_model/article/article_cubit.dart';
import 'package:gradutionproject/core/article/presentation/view_model/article/article_state.dart';
import 'package:gradutionproject/core/shared_widget/custom_text_form_field.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../features/medicines/data/model/list/list_dummy_data_medicines.dart';
import '../../../../../features/medicines/presentation/viewModel/medicines_cubit.dart';
import '../../../../navigation/navigation_manager.dart';
import '../../../../shared_model/resuable_model.dart';
import '../../../../shared_widget/reusable_item_card .dart';
import '../../../../utils/debouncer.dart';
import '../../../data/model/article/artcile_model.dart';
import '../article_by_id/article_details_by_id_screen.dart';

class ArticleSearchBody extends StatelessWidget {
  const ArticleSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(delay: const Duration(milliseconds: 500));

    return BlocBuilder<ArticleCubit, ArticleState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomTextField(hintText: LocaleKeys.searchHere.tr(),
                  title: "",
                  onChanged: (value) {
                    debouncer.run(() {
                       context.read<ArticleCubit>().getArticleBySearch(search:value);
                    });
                  },
                ),
              ),
              _buildContent(context,state)
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, ArticleState state) {
    if (state is ArticleSearchSuccessState ||
        state is ArticleSearchLoadingState) {
      final articles = state is ArticleSearchSuccessState
          ? state.articles ?? []
          : dummyArticles;

      return articles.isEmpty
          ? const SliverToBoxAdapter(
        child: Center(child: Text('لا توجد نتائج')),
      )
          : SliverToBoxAdapter(
        child: Skeletonizer(
            enabled: state is ArticleSearchLoadingState,
            effect: ShimmerEffect(
              baseColor: Colors.grey[400]!,
              highlightColor: const Color(0xff3640CE).withOpacity(0.2),
              //// Primary color
              duration: const Duration(seconds: 2),
            ),
            child: ArticlesSearchList(articles: articles,)),
      );
    }

    if (state is ArticleSearchErrorState) {
      return SliverToBoxAdapter(
        child: Center(child: Text(state.message)),
      );
    }

    return const SliverToBoxAdapter(child: SizedBox.shrink());
  }
}


class ArticlesSearchList extends StatelessWidget {
  final List<ArticleModel> articles;
  const ArticlesSearchList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ArticleState>(
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return AnimatedSwitcher(
              duration:
              const Duration(milliseconds: 400), // Animation duration
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SizeTransition(
                    sizeFactor:
                    animation,
                    axis: Axis.vertical, // Controls the resizing direction
                    child: child,
                  ),
                );
              },
              child: basicButtonList(articleModel: articles[index]),
            );
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
          NavigationManager.push(ArticleDetailsById.id,
              arguments: {
                'articleId': articleModel.id,
              }
          );
        },
      )
    );
  }
}
