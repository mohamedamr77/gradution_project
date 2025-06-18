class ChildRequestModel {
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final String? gender;
  final double? weight;
  final double? height;

  const ChildRequestModel({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.weight,
    this.height,
  });

  factory ChildRequestModel.fromJson(Map<String, dynamic> json) {
    return ChildRequestModel(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender: json['gender'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'weight': weight,
      'height': height,
    };
  }
}
