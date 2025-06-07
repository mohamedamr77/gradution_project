import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/features/medicines/data/model/medication_response.dart';

abstract class MedicinesRepo{
  Future<Either<Failure,MedicationResponse>> getAllMedicine();
}