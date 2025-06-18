import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';

abstract class ProfileSettingRepo {
  Future<Either<Failure,void>> deleteAccount({required String userId});
}