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