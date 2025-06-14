import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/side_effects/data/repo/article/article_repo.dart';
import 'package:gradutionproject/features/side_effects/presentation/view_model/article/article_state.dart';

import '../../../data/model/article/artcile_model.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit({required this.articleRepo}) : super(ArticleInitialState());
  final ArticleRepo articleRepo;
   List<ArticleModel>? articlesSideEffectFeature = [];
  List<ArticleModel>?articlesSideEffectNotFeature = [];
  Future<void> getAllArticle() async {
    emit(ArticleLoadingState());
    final result = await articleRepo.getAllArticle();
    result.fold(
      (l) {
        emit(ArticleErrorState(message: l.message));
      },
      (r) {
        articlesSideEffectFeature = r.data?.rows?.where((article) => article.isFeatured ==true && article.category=="Articles about side effects").toList();
        articlesSideEffectNotFeature = r.data?.rows?.where((article) => article.isFeatured ==false &&  article.category=="Articles about side effects").toList();
        debugPrint("articlesFeature: ${articlesSideEffectFeature?.length}");
        debugPrint("articlesNotFeature: ${articlesSideEffectNotFeature?.length}");
        emit(ArticleSuccessState());
      },
    );
  }
}
