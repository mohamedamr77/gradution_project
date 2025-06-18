import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/profile_setting/data/repo/profile_setting_repo.dart';
import 'package:gradutionproject/features/profile_setting/presentation/view_model/profile_setting_state.dart';

class ProfileSettingCubit extends Cubit<ProfileSettingState> {
  ProfileSettingCubit(this.profileSettingRepo) : super(ProfileSettingInitial());
  final ProfileSettingRepo profileSettingRepo;
  Future<void> deleteAccount({required String userId}) async {
    emit(ProfileSettingLoading());
    final result = await profileSettingRepo.deleteAccount(userId: userId);
    result.fold((l) {
      emit(ProfileSettingError(l.message));
    }, (r) {
      emit(ProfileSettingSuccess());
    });
  }
}
