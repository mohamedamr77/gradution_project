import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/medicines/data/repo/medicines_repo.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicines_state.dart';

import 'medicine_by_id_state.dart';

class MedicineByIdCubit extends Cubit<MedicineByIdState> {
  MedicineByIdCubit({required this.medicinesRepo}) : super(MedicineByIdInitialState());
   String? medicineId;
  final MedicinesRepo medicinesRepo;
  Future<void> getMedicineById({required String id}) async {
    emit(MedicineByIdLoadingState());
    medicineId = id;
    final result = await medicinesRepo.getMedicineDetails(id: id);
    result.fold(
          (failure) {
            debugPrint("MedicineByIdCubit: getMedicineById: failure: ${failure.message}");
            emit(MedicineByIdErrorState(message: failure.message));
          },
          (medication) {
            debugPrint("MedicineByIdCubit: getMedicineById: $medication");
            emit(MedicineByIdSuccessState(medication: medication));
          },
    );
  }
}
