import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/core/utils/app_end_point.dart';
import 'package:gradutionproject/features/auth/sign_up/data/model/sign_up_request.dart';
import 'package:gradutionproject/features/auth/sign_up/data/model/auth_response.dart';
import 'package:gradutionproject/features/auth/sign_up/data/repo/sign_up_repo.dart';



class SignUpRepoImpl implements SignUpRepo {
  final ApiService apiService ;

  SignUpRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, AuthResponse>> userRegister({required RegisterRequest registerRequest}) async{
    try {
      final response = await apiService.post(
        endPoint: AppEndPoint.signUp,
        body: {
          "first_name": registerRequest.firstName,
          "last_name": registerRequest.lastName,
          "email": registerRequest.email,
          "phone_number": registerRequest.phoneNumber,
          "password": registerRequest.password,
        },
      );
      if (response["succes"] == true || response["succes"] == "true" || response["succes"] == 1) {
        debugPrint("Sign Up Response: ${response.toString()}");
        final  AuthResponse  authResponse = AuthResponse.fromJson(response);
        return Right(authResponse);
      } else {
        debugPrint("Sign Up Error: ${response.toString()}");
        return Left(ServerFailure(message: response["msg"] ?? "Unknown error"));
      }
    }catch(e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

}