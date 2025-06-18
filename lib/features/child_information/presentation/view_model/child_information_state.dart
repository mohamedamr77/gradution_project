abstract class ChildInformationState {}

class ChildInformationInitialState extends ChildInformationState {}

class ChildImageChangeState extends ChildInformationState {}

class ChangeDateState extends ChildInformationState {}


class ChildInformationLoadingState extends ChildInformationState {}
class ChildInformationSuccessState extends ChildInformationState {}
class ChildInformationErrorState extends ChildInformationState {
  final String errorMessage;

  ChildInformationErrorState(this.errorMessage);
}
