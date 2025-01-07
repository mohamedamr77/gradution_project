import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/viewModel/vaccine_times_state.dart';

class VaccineTimesCubit extends Cubit<VaccineTimesState> {
  VaccineTimesCubit() : super(VaccineTimesInitialState());
  int buttonSelected = 0;
  void selectButton(int index) {
    buttonSelected = index;
    emit(ChangeButtonVaccineTimesState());
  }
}
