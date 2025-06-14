
import '../../../data/model/article/artcile_model.dart';

abstract class ArticleState {}
class ArticleInitialState extends ArticleState {}
class ArticleLoadingState extends ArticleState {}
class ArticleSuccessState extends ArticleState {
  ArticleSuccessState();
}
class ArticleErrorState extends ArticleState {
  final String message;

  ArticleErrorState({required this.message});
}
class ArticleGetByIdSuccessState extends ArticleState {
  final ArticleModel article;

  ArticleGetByIdSuccessState({required this.article});
}
class ArticleGetByIdErrorState extends ArticleState {
  final String message;

  ArticleGetByIdErrorState({required this.message});
}

class ArticleLoadingByIdState extends ArticleState {
  ArticleLoadingByIdState();
}

class GetArticleBySearchSuccessState extends ArticleState {
  final List<ArticleModel> articles;

  GetArticleBySearchSuccessState({required this.articles});
}
class GetArticleBySearchErrorState extends ArticleState {
  final String message;

  GetArticleBySearchErrorState({required this.message});
}
class GetArticleBySearchLoadingState extends ArticleState {
  GetArticleBySearchLoadingState();
}
