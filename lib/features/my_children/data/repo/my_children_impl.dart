import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/core/utils/app_end_point.dart';
import 'package:gradutionproject/features/my_children/data/model/child_response.dart';
import 'package:gradutionproject/features/my_children/data/repo/my_children_repo.dart';

class MyChildrenImpl implements MyChildrenRepo {
  final ApiService apiService;

  MyChildrenImpl({required this.apiService});
  @override
  Future<Either<Failure, ChildResponse>> getMyChildren() async {
    try {
      final response =
          await apiService.get(endPoint: AppEndPoint.getMyChildren);
      if (response["success"] == true) {
        final childResponse = ChildResponse.fromJson(response);
        return Right(childResponse);
      } else {
        return Left(ServerFailure(message: response["msg"] ?? "Unknown error"));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
