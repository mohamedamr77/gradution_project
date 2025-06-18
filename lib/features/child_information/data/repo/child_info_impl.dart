import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/core/utils/app_end_point.dart';
import 'package:gradutionproject/features/child_information/data/repo/child_info_repo.dart';

import '../model/child_rquest_model.dart';

class ChildInfoImpl implements ChildInfoRepo{
  final ApiService apiService;

  ChildInfoImpl({required this.apiService});
  @override
  Future<Either<Failure, void>> addNewChild({required  ChildRequestModel childRequestModel}) async{
    try{
      final response = await apiService.post(endPoint: AppEndPoint.createChild,
        body: childRequestModel.toJson(),
      );
      if (response["success"] ==true) {
        return const Right(null);
      } else {
        return Left(ServerFailure(message: response["msg"] ?? "Unknown error"));
        
      }  

    }catch(e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

}