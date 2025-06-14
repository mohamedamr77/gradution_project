import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/article/presentation/view_model/article/article_cubit.dart';
import 'package:gradutionproject/core/article/presentation/view_model/article/article_state.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/shared_model/resuable_model.dart';

import '../../../../../../core/article/data/model/article/artcile_model.dart';
import '../../../../../../core/shared_widget/custom_title_text.dart';
import '../../../../../../core/shared_widget/global_text.dart';
import '../../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/locale_keys.g.dart';
import '../../../../data/model/side_effect_details_list.dart';

class SideEffectDetailsBody extends StatefulWidget {
  final String articleId;

  const SideEffectDetailsBody({super.key, required this.articleId});

  @override
  State<SideEffectDetailsBody> createState() => _SideEffectDetailsBodyState();
}

class _SideEffectDetailsBodyState extends State<SideEffectDetailsBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ArticleCubit>(context).getArticleById(id: widget.articleId);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ArticleCubit>(context);
    return BlocBuilder<ArticleCubit, ArticleState>(
      builder: (context, state) {
        return state is ArticleLoadingByIdState
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : state is ArticleGetByIdSuccessState
            ? Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.04.w, vertical: 0.02.h),
          child: CustomScrollView(
            slivers: [
              _buildReusableItemCard(articleModel: state.article),
              _buildSpacer(height: 24),
              _buildSectionTitle("Content"),
              _buildSpacer(height: 8),
              _buildContent(state.article.content??LocaleKeys.unAvailable.tr()),
              _buildSpacer(height: 8),
              _buildSectionTitle("author"),
              _buildTipsList(state.article.author??[]),

            ],
          ),
        )
            : state is ArticleGetByIdErrorState
            ? Center(
          child: Text(
            state.message,
            style: const TextStyle(
                color: AppColors.redColor, fontSize: 16),
          ),
        )
            : const SizedBox();
      },
    );
  }

  SliverToBoxAdapter _buildReusableItemCard({required ArticleModel articleModel}) {

    return SliverToBoxAdapter(
      child: ReusableItemCard(
        reusableModel: ReusableModel(
          imagePath: articleModel.image ?? "https://th.bing.com/th/id/R.8f829da9a5e99e16cdf785b35721d484?rik=DXgAfHOQWSFbVw&pid=ImgRaw&r=0",
          title: articleModel.title?? LocaleKeys.unAvailable.tr(),
          description: articleModel.status?? LocaleKeys.unAvailable.tr(),
          subDescription: articleModel.author?[0]??"",
          onPressedIconFavourite: () {},
          onTapCard: () {},
          isDetails: true,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildSpacer({required double height}) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }

  SliverToBoxAdapter _buildSectionTitle(String title) {
    return SliverToBoxAdapter(
      child: CustomTitleText(title: title),
    );
  }

  SliverList _buildTipsList(List<String> tipsList) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return GText(
          color: AppColors.mediumGrayColor,
          content: "${index + 1} . ${tipsList[index]}",
          fontSize: 14,
          fontWeight: FontWeight.w400,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemCount: tipsList.length,
    );
  }

  SliverToBoxAdapter _buildContent(String content) {
    return SliverToBoxAdapter(
      child: GText(
        color: AppColors.mediumGrayColor,
        content: content,
        fontSize: 16,
        textAlign: TextAlign.justify,
        fontWeight: FontWeight.w400,
      ),
    );
  }

}
