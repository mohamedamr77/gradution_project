import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';

import '../model/child_rquest_model.dart';

abstract class ChildInfoRepo{
  Future<Either<Failure,void>> addNewChild({required  ChildRequestModel childRequestModel});
}