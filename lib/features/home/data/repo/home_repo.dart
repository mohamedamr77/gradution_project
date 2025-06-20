import '../../../../core/error/faliure.dart';
import 'package:dartz/dartz.dart';

import '../model/home_model.dart';
abstract class HomeRepo {
  Future<Either<Failure, HomeModel>> getHomeData();
}