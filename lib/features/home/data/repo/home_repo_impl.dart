import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/features/home/data/model/home_model.dart';
import 'package:gradutionproject/features/home/data/repo/home_repo.dart';

class HomeRepoImplement implements HomeRepo{
  final ApiService apiService;

  HomeRepoImplement({required this.apiService});
  @override
  Future<Either<Failure, HomeModel>> getHomeData() async{
    try {
      var response =await apiService.get(
          endPoint: "/user/getAll",
         token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdF9uYW1lIjoiRmlyc3QiLCJ1c2VySWQiOjcwLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NDM1Mzc2NTMsImV4cCI6MTc0NjEyOTY1M30.R9PP6k7U9xTkUHwPaYxMUUil-jVAg7NAKVYPcg30sfg"
      );
      return right(response);
    }catch (e){
      return left(ServerFailure( message: e.toString(),));
    }
  }
}