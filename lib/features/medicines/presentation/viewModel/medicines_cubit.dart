import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/medicines/data/repo/medicines_repo.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicines_state.dart';

class MedicinesCubit extends Cubit<MedicinesState> {
  MedicinesCubit({required this.medicinesRepo})
      : super(MedicinesInitialState());
  int buttonSelected = 0;
  final MedicinesRepo medicinesRepo;

  void selectButton(int index) {
    buttonSelected = index;
    emit(ChangeButtonMedicinesStateState());
  }

  Future<void> getAllMedicines() async {
    emit(GetAllMedicinesLoadingState());
    final result = await medicinesRepo.getAllMedicine();
    result.fold(
          (failure) {
            debugPrint("Error Medicine: ${failure.message}");
            emit(GetAllMedicinesErrorState(failure.message));
          },
          (medicationResponse) =>
          emit(GetAllMedicinesSuccessState(medicationResponse)),
    );
  }
}