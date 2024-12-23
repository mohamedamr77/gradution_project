import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_information_state.dart';

class ChildInformationCubit extends Cubit<ChildInformationState> {
  ChildInformationCubit() : super(ChildInformationInitialState());
  File? image;

  setPhoto(File photo) async {
    image = photo;
    emit(ChildImageChangeState());
  }

}
