import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/favourite_items/presentation/viewModel/favouite_item_state.dart';

class FavouriteItemsCubit extends Cubit<FavouriteItemsState> {
  FavouriteItemsCubit() : super(FavouriteItemsInitialState());
  int buttonSelected = 0;
  void selectButton(int index) {
    buttonSelected = index;
    emit(ChangeButtonState());
  }
}
