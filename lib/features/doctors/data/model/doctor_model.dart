class DoctorModel {
  final int? userId;
  final String? firstName;
  final String? lastName;
  final String? imageUrl;
  final String? email;
  final String? phoneNumber;
  final String? createdAt;
  final String? specialization;
  final String? licenseNumber;
  final bool? verified;

  const DoctorModel({
    this.userId,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.email,
    this.phoneNumber,
    this.createdAt,
    this.specialization,
    this.licenseNumber,
    this.verified,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      userId: json['user_id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      imageUrl: json['image_url'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      createdAt: json['created_at'] as String?,
      specialization: json['specialization'] as String?,
      licenseNumber: json['license_number'] as String?,
      verified: json['verified'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'image_url': imageUrl,
      'email': email,
      'phone_number': phoneNumber,
      'created_at': createdAt,
      'specialization': specialization,
      'license_number': licenseNumber,
      'verified': verified,
    };
  }
}
