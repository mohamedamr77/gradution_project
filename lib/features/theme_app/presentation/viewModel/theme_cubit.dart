import 'package:bloc/bloc.dart';
import 'package:gradutionproject/features/theme_app/presentation/viewModel/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitialState());
  bool isLight= true;
  toggleTheme(){
    isLight =!isLight;
    emit(ChangeThemeButtonState());
  }
}
