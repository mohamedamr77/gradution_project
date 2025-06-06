import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/core/utils/app_end_point.dart';
import 'package:gradutionproject/features/auth/login/data/model/login_request_model.dart';
import 'package:gradutionproject/features/auth/sign_up/data/model/auth_response.dart';

import 'login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService;

  LoginRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, AuthResponse>> userLogin({required LoginRequest loginRequest}) async{
    try{
      final response = await apiService.post(
        endPoint: AppEndPoint.login,
         body: loginRequest.toJson(),
      );
      if (response["success"] == true ) {
        final AuthResponse authResponse = AuthResponse.fromJson(response);
        return Right(authResponse);
      } else {
        return Left(ServerFailure(message: response["msg"] ?? "Unknown error"));
      }
    }catch(e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}