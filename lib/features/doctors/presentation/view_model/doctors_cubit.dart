import 'package:flutter_bloc/flutter_bloc.dart';
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
        emit(DoctorsSuccessState(doctors: doctorsResponse.data?.rows));
      },
    );
  }
}