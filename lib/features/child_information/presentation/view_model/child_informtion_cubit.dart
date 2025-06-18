import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/features/child_information/data/model/child_rquest_model.dart';
import 'package:gradutionproject/features/child_information/data/repo/child_info_repo.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_information_state.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/shared_widget/toast_utils.dart';

class ChildInformationCubit extends Cubit<ChildInformationState> {
  ChildInformationCubit(this.childInfoRepo) : super(ChildInformationInitialState());
  File? image;
  final ChildInfoRepo childInfoRepo ;
  ChildRequestModel? childRequestModel;
  DateTime firstDate = DateTime.now().subtract(const Duration(days: 365 * 5));
  DateTime lastDate = DateTime.now();
  DateTime? selectedDate;

  updateSelectedDate(selectDate) {
    selectedDate = selectDate;
    emit(ChangeDateState());
  }

  String convertDateString(DateTime date) {
    return date.toString().split(" ")[0];
  }

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

  Future<void> addNewChild()async{
    emit(ChildInformationLoadingState());
    final result =await  childInfoRepo.addNewChild(childRequestModel: ChildRequestModel(
      firstName: childRequestModel?.firstName ?? '',
      lastName: childRequestModel?.lastName ?? '',
      dateOfBirth: convertDateString(selectedDate ?? DateTime.now()),
      gender: childRequestModel?.gender??"",
      height: childRequestModel?.height ?? 0.0,
      weight: childRequestModel?.weight ?? 0.0,
    ));

  result.fold((l) {
    ToastUtils.showToast(message: l.message);
    emit(ChildInformationErrorState(l.message));
  }, (r) {
    ToastUtils.showToast(message: "تم اضافة الطفل بنجاح",
    backgroundColor: AppColors.greenColor,
    );
    emit(ChildInformationSuccessState());
  },);
  }

}
