import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repo/article/article_repo.dart';
import 'article_search_state.dart';

class ArticleSearchCubit extends Cubit<ArticleSearchState> {
  ArticleSearchCubit({required this.articleRepo}) : super(ArticleSearchInitialState());
  final ArticleRepo articleRepo;
  Future<void> getArticleBySearch({required String search}) async {
    final result = await articleRepo.searchArticle(search: search);
    result.fold((l) {
      emit(ArticleSearchErrorState(message: l.message));
    }, (r) {
      emit(ArticleSearchSuccessState(articles: r.data?.rows));
    },);

  }

}
