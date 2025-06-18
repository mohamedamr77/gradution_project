import '../../../../data/model/article/artcile_model.dart';

abstract class ArticleSearchState {}
class ArticleSearchInitialState extends ArticleSearchState {
  ArticleSearchInitialState();
}
class ArticleSearchLoadingState extends ArticleSearchState {
  ArticleSearchLoadingState();
}
class ArticleSearchSuccessState extends ArticleSearchState {
  final List<ArticleModel>? articles;

  ArticleSearchSuccessState({required this.articles});
}
class ArticleSearchErrorState extends ArticleSearchState {
  final String message;

  ArticleSearchErrorState({required this.message});
}