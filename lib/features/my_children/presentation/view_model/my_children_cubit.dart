import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/my_children/data/repo/my_children_repo.dart';
import 'package:gradutionproject/features/my_children/presentation/view_model/my_children_state.dart';

class MyChildrenCubit extends Cubit<MyChildrenState> {
  MyChildrenCubit({required this.myChildrenRepo})
      : super(MyChildrenInitialState());
  final MyChildrenRepo myChildrenRepo;
  Future<void> getMyChildren() async {
    emit(MyChildrenLoadingState());
    final result = await myChildrenRepo.getMyChildren();
    result.fold(
      (l) {
        emit(MyChildrenErrorState(l.message));
      },
      (r) {
        emit(MyChildrenSuccessState(childResponse: r));
      },
    );
  }
}
