class VaccineModel {
  final int? vaccineId;
  final String? vaccineName;
  final String? description;
  final int? minAge;
  final int? maxAge;
  final int? dosesRequired;
  final bool? isMandatory;

  const VaccineModel({
    this.vaccineId,
    this.vaccineName,
    this.description,
    this.minAge,
    this.maxAge,
    this.dosesRequired,
    this.isMandatory,
  });

  factory VaccineModel.fromJson(Map<String, dynamic> json) {
    return VaccineModel(
      vaccineId: json['vaccine_id'] as int?,
      vaccineName: json['vaccine_name'] as String?,
      description: json['description'] as String?,
      minAge: json['min_age'] as int?,
      maxAge: json['max_age'] as int?,
      dosesRequired: json['doses_required'] as int?,
      isMandatory: json['is_mandatory'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vaccine_id': vaccineId,
      'vaccine_name': vaccineName,
      'description': description,
      'min_age': minAge,
      'max_age': maxAge,
      'doses_required': dosesRequired,
      'is_mandatory': isMandatory,
    };
  }
}
