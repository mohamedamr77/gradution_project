import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';

import '../model/vaccine/vaccine_reponse_model.dart';

abstract class VaccineRepo{
  Future<Either<Failure,VaccineResponseModel>> getAllVaccine();
  Future<Either<Failure,VaccineResponseModel>> getVaccineById({required String id});
}