import 'package:bloc/bloc.dart';

import 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit() : super(ChangePassInitialState());

  String? password;
  String? confirmPassword;
}
