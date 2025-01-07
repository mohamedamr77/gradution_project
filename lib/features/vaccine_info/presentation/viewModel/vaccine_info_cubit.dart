import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/viewModel/vaccine_info_state.dart';

class VaccineInfoCubit extends Cubit<VaccineInfoState> {
  VaccineInfoCubit() : super(VaccineInfoInitialState());
  int buttonSelected = 0;
  void selectButton(int index) {
    buttonSelected = index;
    emit(ChangeButtonVaccineInfoState());
  }
}
