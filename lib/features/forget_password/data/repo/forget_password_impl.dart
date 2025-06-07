import 'package:dartz/dartz.dart';

import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/core/utils/app_end_point.dart';

import 'package:gradutionproject/features/forget_password/data/model/forget_password/forget_password_response.dart';

import 'foreget_password_repo.dart';

class ForgetPasswordImpl implements ForgetPasswordRepo {
  final ApiService apiService;

  ForgetPasswordImpl({required this.apiService});
  @override
  Future<Either<Failure, ForgetPasswordResponse>> forgotPassword({required String email}) async{
    try{
      final response = await apiService.get(
          endPoint: AppEndPoint.forgetPassword,
      );
      if (response["success"] == true) {
        final ForgetPasswordResponse forgetPasswordResponse = ForgetPasswordResponse.fromJson(response);
        return Right(forgetPasswordResponse);
      } else {
        return Left(ServerFailure(message: response["message"] ?? "Unknown error"));
      }
    }catch(e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}