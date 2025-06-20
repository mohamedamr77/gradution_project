class UserModel {
  final String? firstName;
  final int? userId;
  final String? role;

  UserModel({
    this.firstName,
    this.userId,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'] as String?,
      userId: json['user_id'] as int?,
      role: json['role'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'user_id': userId,
      'role': role,
    };
  }
}