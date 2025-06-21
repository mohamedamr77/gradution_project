import 'package:gradutionproject/features/my_children/data/model/child_response.dart';

abstract class MyChildrenState {}

class MyChildrenInitialState extends MyChildrenState {}

class MyChildrenLoadingState extends MyChildrenState {}

class MyChildrenErrorState extends MyChildrenState {
  final String message;
  MyChildrenErrorState(this.message);
}

class MyChildrenSuccessState extends MyChildrenState {
  final ChildResponse childResponse;

  MyChildrenSuccessState({required this.childResponse});
}
