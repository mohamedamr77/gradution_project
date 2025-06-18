import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/vaccine_times/data/model/vaccine/vaccine_model.dart';
import 'package:gradutionproject/features/vaccine_times/data/repo/vaccine_repo.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/viewModel/vaccine_cubit/vaccine_state.dart';

class VaccineCubit extends Cubit<VaccineState> {
  VaccineCubit({required this.vaccineRepo}) : super(VaccineInitialState());
  final VaccineRepo vaccineRepo;
  static VaccineCubit get(context) => BlocProvider.of(context);

   List<VaccineModel>? vaccineListBasic = [];
   List<VaccineModel>? vaccineListAdditional = [];
  Future<void> getAllVaccine() async {
    emit(VaccineLoadingState());
    final result = await vaccineRepo.getAllVaccine();
    result.fold(
      (l) {
        emit(VaccineErrorState(l.message));
      },
      (r) {
        emit(VaccineSuccessState(vaccines: r.data?.rows ?? []));
      },
    );
  }

  Future<void> getVaccineById({required String id}) async {
    emit(VaccineDetailsLoadingState());
    final result = await vaccineRepo.getVaccineById(id: id);
    result.fold(
      (l) {
        emit(VaccineDetailsErrorState(l.message));
      },
      (r) {
        vaccineListBasic = r.data?.rows?.where((article) => article.isMandatory ==true).toList();
        vaccineListAdditional = r.data?.rows?.where((article) => article.isMandatory ==false).toList();
        emit(VaccineDetailsSuccessState(vaccine: r.data?.rows?[0]??const VaccineModel()));
      },
    );
}}
