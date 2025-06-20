import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/features/medicines/data/model/medication_response.dart';

import '../model/medication_model.dart';

abstract class MedicinesRepo{
  Future<Either<Failure,MedicationResponse>> searchMedicine({required String search});
  Future<Either<Failure, MedicationModel>> getMedicineDetails({required String id});

}