import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/features/auth/sign_up/data/model/auth_response.dart';

import '../model/login_request_model.dart';

abstract class LoginRepo{
  Future<Either<Failure,AuthResponse>> userLogin({required LoginRequest loginRequest});
}