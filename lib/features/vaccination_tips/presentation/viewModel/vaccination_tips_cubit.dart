import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/vaccination_tips/presentation/viewModel/vaccination_tips_state.dart';

class VaccinationTipsCubit extends Cubit<VaccinationTipsState> {
  VaccinationTipsCubit() : super(VaccinationTipsInitialState());
  int buttonSelected = 0;
  void selectButton(int index) {
    buttonSelected = index;
    emit(ChangeButtonVaccinationTipsState());
  }
}
