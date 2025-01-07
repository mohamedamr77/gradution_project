import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicines_state.dart';

class MedicinesCubit extends Cubit<MedicinesState> {
  MedicinesCubit() : super(MedicinesInitialState());
  int buttonSelected = 0;
  void selectButton(int index) {
    buttonSelected = index;
    emit(ChangeButtonMedicinesStateState());
  }
}
