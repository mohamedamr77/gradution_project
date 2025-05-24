import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradutionproject/features/language_app/presentation/viewModel/language_app_state.dart';

import '../../../home/data/model/home_model.dart';
import '../../../home/data/repo/home_repo.dart';

class LanguageAppCubit extends Cubit<LanguageAppState> {
  final HomeRepo homeRepo;
  HomeModel? homeModel;
  LanguageAppCubit({required this.homeRepo}) : super(LanguageAppInitialState());
  bool isArabic = true;
  changeLanguage(bool isArabic) {
    this.isArabic = isArabic;
    emit(ChangeLanguageButtonState());
  }


  fetchGetAllLevel() async {
    emit(HomeStateLoading());
    var result = await homeRepo.getHomeData();
    result.fold((error) {
      debugPrint(error.message);
      emit(HomeStateFaliure( error: error.message,));
    }, (success) {
      homeModel = success;
      debugPrint(success.success.toString());
      debugPrint("Home Model Data ${success.data.toString()}");
      emit(HomeStateSuccess());
    });
  }
}
