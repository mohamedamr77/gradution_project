import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/features/side_effects/data/model/article/artcile_model.dart';

import '../../model/article/article_response.dart';

abstract class ArticleRepo {
 Future<Either<Failure,ArticleResponse>> getAllArticle();
 Future<Either<Failure,ArticleModel>> getArticleById({required String id});
Future<Either<Failure,ArticleResponse>>  searchArticle({required String search});
}