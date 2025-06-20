abstract class ProfileSettingState {}
class ProfileSettingInitial extends ProfileSettingState {}

class ProfileSettingLoading extends ProfileSettingState {}
class ProfileSettingSuccess extends ProfileSettingState {
  ProfileSettingSuccess();
}
class ProfileSettingError extends ProfileSettingState {
  final String error;

  ProfileSettingError(this.error);
}