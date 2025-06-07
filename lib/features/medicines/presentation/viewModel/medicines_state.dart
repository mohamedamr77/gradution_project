import '../../data/model/medication_response.dart';

abstract class MedicinesState {}

class MedicinesInitialState extends MedicinesState {}

class ChangeButtonMedicinesStateState extends MedicinesState {}

class GetAllMedicinesLoadingState extends MedicinesState {}
class GetAllMedicinesSuccessState extends MedicinesState {
  final MedicationResponse medicineResponse;

  GetAllMedicinesSuccessState(this.medicineResponse);
}
class GetAllMedicinesErrorState extends MedicinesState {
  final String error;

  GetAllMedicinesErrorState(this.error);
}