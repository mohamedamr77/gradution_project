import 'package:dartz/dartz.dart';

import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/core/utils/app_end_point.dart';
import 'package:gradutionproject/features/medicines/data/model/medication_model.dart';

import 'package:gradutionproject/features/medicines/data/model/medication_response.dart';

import 'medicines_repo.dart';

class MedicinesRepoImpl implements MedicinesRepo {
  final ApiService apiService;

  MedicinesRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, MedicationResponse>> searchMedicine({required String search}) async{
    try {
      final response = await apiService.get(
        endPoint: AppEndPoint.searchMedicine(search),
      );
      if (response["success"] ==true) {
        final medicationResponse = MedicationResponse.fromJson(response);
        return Right(medicationResponse);
      }  else {

        return const Left(ServerFailure(message: "حدث خطأ فى استرجاع البيانات"));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MedicationModel>> getMedicineDetails({required String id}) async{
   try{
     final  response = await apiService.get(
        endPoint: AppEndPoint.getMedicineById(id),
      );
      if (response["success"] == true) {
        final medicationModel = MedicationModel.fromJson(response);
        return Right(medicationModel);
      } else {
        return const Left(ServerFailure(message: "حدث خطأ فى استرجاع البيانات"));
      }
   }catch(e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

}