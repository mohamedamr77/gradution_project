import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';

import '../model/forget_password/forget_password_response.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure,ForgetPasswordResponse>> forgotPassword({required String email});
}