import '../../../data/model/vaccine/vaccine_model.dart';

abstract class VaccineState{}
class VaccineInitialState extends VaccineState {}
class VaccineLoadingState extends VaccineState {}
class VaccineSuccessState extends VaccineState {
  final  List<VaccineModel>  vaccines;

  VaccineSuccessState({required this.vaccines});
}
class VaccineErrorState extends VaccineState {
  final String errorMessage;

  VaccineErrorState(this.errorMessage);
}

class VaccineDetailsLoadingState extends VaccineState {}
class VaccineDetailsSuccessState extends VaccineState {
  final VaccineModel vaccine;

  VaccineDetailsSuccessState({required this.vaccine});
}
class VaccineDetailsErrorState extends VaccineState {
  final String errorMessage;

  VaccineDetailsErrorState(this.errorMessage);
}