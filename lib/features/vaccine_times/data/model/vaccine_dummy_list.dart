import 'package:gradutionproject/features/vaccine_times/data/model/vaccine/vaccine_model.dart';

final List<VaccineModel> dummyVaccineList = [
  const VaccineModel(
    vaccineId: 1,
    vaccineName: "BCG",
    description: "Swelling or pus may appear at the injection site, and this is normal.",
    minAge: 1,
    maxAge: 2,
    dosesRequired: 1,
    isMandatory: true,
  ),
  const VaccineModel(
    vaccineId: 2,
    vaccineName: "OPV",
    description: "Spots in the mouth",
    minAge: 1,
    maxAge: 18,
    dosesRequired: 5,
    isMandatory: false,
  ),
  const VaccineModel(
    vaccineId: 3,
    vaccineName: "IPV",
    description: "Intramuscular injection",
    minAge: 2,
    maxAge: 6,
    dosesRequired: 3,
    isMandatory: true,
  ),
  const VaccineModel(
    vaccineId: 4,
    vaccineName: "Hexavalent vaccine",
    description: "Intramuscular injection in the thigh",
    minAge: 2,
    maxAge: 6,
    dosesRequired: 5,
    isMandatory: true,
  ),
];
