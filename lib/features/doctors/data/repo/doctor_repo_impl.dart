import 'package:dartz/dartz.dart';
import 'package:gradutionproject/core/error/faliure.dart';
import 'package:gradutionproject/core/utils/app_end_point.dart';
import 'package:gradutionproject/features/doctors/data/model/doctor_full_response.dart';
import 'package:gradutionproject/features/doctors/data/repo/doctors_repo.dart';

import '../../../../core/helper/api_service.dart';

class DoctorRepoImpl implements DoctorsRepo{
  final ApiService apiService;

  DoctorRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, DoctorFullResponse>> getDoctors() async{
    try{
      final response = await apiService.get(
        endPoint: AppEndPoint.doctorsGetAll,
      );
      if (response["success"]==true) {
        final doctorFullResponse = DoctorFullResponse.fromJson(response);
        return Right(doctorFullResponse);
      } else {
        return const Left(ServerFailure(message: "Failed to fetch doctors"));
      }
    }catch(e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

}