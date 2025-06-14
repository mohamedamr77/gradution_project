
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
