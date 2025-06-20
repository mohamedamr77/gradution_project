import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/side_effects/presentation/view_model/side_effects_state.dart';

class SideEffectsCubit extends Cubit<SideEffectsState> {
  SideEffectsCubit() : super(SideEffectInitialState());

  int buttonSelected = 0;

  void selectButton(int index) {
    buttonSelected = index;
    emit(SideEffectInitialState());
  }
}
