import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/features/auth/sign_up/data/model/sign_up_response.dart';

import '../model/sign_up_request.dart';

abstract class SignUpRepo{
  Future<Either<Failure,SignUpResponse>> userRegister({required RegisterRequest registerRequest});
}
