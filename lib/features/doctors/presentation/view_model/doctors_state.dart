import 'package:gradutionproject/features/doctors/data/model/doctor_model.dart';

abstract class DoctorsState{}
class DoctorsInitialState extends DoctorsState {
  DoctorsInitialState();
}
class DoctorsLoadingState extends DoctorsState {
  DoctorsLoadingState();
}
class DoctorsSuccessState extends DoctorsState {
  final List<DoctorModel>? doctors;
  DoctorsSuccessState({required this.doctors});
}
class DoctorsErrorState extends DoctorsState {
  final String message;
  DoctorsErrorState({required this.message});
}
