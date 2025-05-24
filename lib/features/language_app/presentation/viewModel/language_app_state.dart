abstract class LanguageAppState {}

class LanguageAppInitialState extends LanguageAppState {}

class ChangeLanguageButtonState extends LanguageAppState {}

class HomeStateLoading extends LanguageAppState {}
class HomeStateFaliure extends LanguageAppState {
  final String error;

  HomeStateFaliure({required this.error});
}
class HomeStateSuccess extends LanguageAppState {}
