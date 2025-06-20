import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/core/utils/app_end_point.dart';
import 'package:gradutionproject/features/vaccine_times/data/model/vaccine/vaccine_reponse_model.dart';
import 'package:gradutionproject/features/vaccine_times/data/repo/vaccine_repo.dart';

class VaccineRepoImpl implements VaccineRepo{
  final ApiService apiService;

  VaccineRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, VaccineResponseModel>> getAllVaccine() async{
   try{
     final response = await  apiService.get(endPoint:AppEndPoint.getAllVaccine );
      if (response["success"] ==true) {
        final vaccineResponse = VaccineResponseModel.fromJson(response);
        return Right(vaccineResponse);
      }  else {
        return Left(ServerFailure(message: response["msg"] ?? "Unknown error"));
      }
   }catch(e){
     return Left(ServerFailure(message: e.toString()));
   }
  }

  @override
  Future<Either<Failure, VaccineResponseModel>> getVaccineById({required String id}) async{
    try{
      final response = await  apiService.get(endPoint: AppEndPoint.getVaccineById(id: id));
      if (response["success"] ==true) {
        final vaccineResponse = VaccineResponseModel.fromJson(response);
        return Right(vaccineResponse);
      }  else {
        return Left(ServerFailure(message: response["msg"] ?? "Unknown error"));
      }
    }catch(e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

}