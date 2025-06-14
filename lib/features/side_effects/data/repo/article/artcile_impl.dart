import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/core/utils/app_end_point.dart';
import 'package:gradutionproject/features/side_effects/data/model/article/artcile_model.dart';
import 'package:gradutionproject/features/side_effects/data/model/article/article_response.dart';
import 'package:gradutionproject/features/side_effects/data/repo/article/article_repo.dart';

class ArticleImpl implements ArticleRepo{
  final ApiService apiService;

  ArticleImpl({required this.apiService});
  @override
  Future<Either<Failure, ArticleResponse>> getAllArticle() async{
   try{
     final response = await apiService.get(
         endPoint: AppEndPoint.articleGetAll);
     if (response["success"] ==true) {
        // Parse the response and return a Success
       final articleResponse = ArticleResponse.fromJson(response);
       return Right(articleResponse);
     } else {
       // If the response indicates failure, return a Failure
       return Left(ServerFailure(message: response["msg"] ?? "Unknown error"));
     }
   }catch(e) {
     return Left(ServerFailure(message: e.toString()));
   }
  }

  @override
  Future<Either<Failure, ArticleModel>> getArticleById({required String id}) async{
  try{
    final response = await apiService.get(
      endPoint: AppEndPoint.getArticleById(id: id),
    );
    if (response["success"] == true) {
      final articleModel = ArticleModel.fromJson(response["data"]);
      return Right(articleModel);
    } else {
      return Left(ServerFailure(message: response["msg"] ?? "Unknown error"));
    }
  }
  catch(e) {
    return Left(ServerFailure(message: e.toString()));
  }

  }

  @override
  Future<Either<Failure, ArticleResponse>> searchArticle({required String search}) async{
    try{
      final response = await apiService.get(
        endPoint: AppEndPoint.searchArticle(search: search),
      );
      if (response["success"] == true) {
        final articleResponse = ArticleResponse.fromJson(response);
        return Right(articleResponse);
      } else {
        return Left(ServerFailure(message: response["msg"] ?? "Unknown error"));
      }
    }
    catch(e) {
      return Left(ServerFailure(message: e.toString()));
    }

  }

}