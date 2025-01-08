import 'package:bloc/bloc.dart';
import 'package:gradutionproject/features/language_app/presentation/viewModel/language_app_state.dart';

class LanguageAppCubit extends Cubit<LanguageAppState> {
  LanguageAppCubit() : super(LanguageAppInitialState());
  bool isArabic = true;
  changeLanguage(bool isArabic) {
    this.isArabic = isArabic;
    emit(ChangeLanguageButtonState());
  }
}
