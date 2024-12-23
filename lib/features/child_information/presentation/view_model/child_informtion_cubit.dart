import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_information_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/shared_widget/toast_utils.dart';

class ChildInformationCubit extends Cubit<ChildInformationState> {
  ChildInformationCubit() : super(ChildInformationInitialState());
  File? image;

  setPhoto(File photo) async {
    image = photo;
    emit(ChildImageChangeState());
  }

   ImagePicker picker = ImagePicker();

   pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      setPhoto(imageFile);
    } else {
      ToastUtils.showToast(message: "لم يتم اختيار صوره");
      // Show a toast if the user cancels the image selection

    }

  }

}
