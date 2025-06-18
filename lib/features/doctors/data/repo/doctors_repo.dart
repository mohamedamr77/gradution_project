import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';

import '../model/doctor_full_response.dart';

abstract class DoctorsRepo{
  Future<Either<Failure,DoctorFullResponse>> getDoctors();
  Future<Either<Failure,DoctorFullResponse>> getDoctorById(String id);

}