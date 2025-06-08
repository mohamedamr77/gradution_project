import '../../../data/model/medication_model.dart';

abstract class MedicineByIdState {}
class MedicineByIdInitialState extends MedicineByIdState {}
class MedicineByIdLoadingState extends MedicineByIdState {}
class MedicineByIdSuccessState extends MedicineByIdState {
  final MedicationModel medication;

  MedicineByIdSuccessState({required this.medication});
}
class MedicineByIdErrorState extends MedicineByIdState {
  final String message;

  MedicineByIdErrorState({required this.message});
}
