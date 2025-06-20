import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/core/utils/app_end_point.dart';
import 'package:gradutionproject/features/profile_setting/data/repo/profile_setting_repo.dart';

class ProfileSettingImpl implements ProfileSettingRepo{
  final ApiService apiService;

  ProfileSettingImpl({required this.apiService});
  @override
  Future<Either<Failure, void>> deleteAccount({required String userId}) async{
    try{
      final response = await  apiService.delete(
            endPoint: AppEndPoint.deleteAccount(id: userId)
      );
      if (response["success"] ==true) {
        debugPrint("Account deleted successfully");
        return const Right(null);
      } else {
        debugPrint("Failed to delete account: ${response["msg"]}");
        return Left(ServerFailure(message: response["msg"] ?? "Unknown error"));
      }
    }catch(e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

}