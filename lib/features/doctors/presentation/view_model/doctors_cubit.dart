import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/doctors/data/model/doctor_model.dart';
import 'package:gradutionproject/features/doctors/data/repo/doctors_repo.dart';
import 'package:gradutionproject/features/doctors/presentation/view_model/doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  DoctorsCubit(this.doctorsRepo) : super(DoctorsInitialState());
  final DoctorsRepo doctorsRepo;

  Future<void> doctorsGetAll() async {
    emit(DoctorsLoadingState());
    final result = await doctorsRepo.getDoctors();
    result.fold(
      (failure) {
        emit(DoctorsErrorState(message: failure.message));
      },
      (doctorsResponse) {
        debugPrint("Doctors ${doctorsResponse.data?.rows.toString()}");
        emit(DoctorsSuccessState(doctors: doctorsResponse.data?.rows));
      },
    );
  }

  Future<void> getDoctorById({required String id}) async {
    emit(GetDoctorByIdLoadingState());
    final result = await doctorsRepo.getDoctorById(id);
    result.fold(
      (failure) {
        emit(GetDoctorByIdErrorState(message: failure.message));
      },
      (doctorResponse) {
        debugPrint("Doctor  Mo ${doctorResponse.data?.rows?[0].toString()}");
        emit(GetDoctorByIdSuccessState(
            doctor: doctorResponse.data?.rows?[0] ?? const DoctorModel()));
      },
    );
  }
}
