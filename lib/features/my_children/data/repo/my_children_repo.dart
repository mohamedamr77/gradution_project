import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/features/my_children/data/model/child_response.dart';

abstract class MyChildrenRepo {
  Future<Either<Failure, ChildResponse>> getMyChildren();
}
