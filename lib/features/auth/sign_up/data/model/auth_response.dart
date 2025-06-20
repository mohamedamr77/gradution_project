
import 'package:gradutionproject/features/auth/sign_up/data/model/user_model.dart';

class AuthResponse {
  final bool? succes;
  final UserModel? user;
  final String? token;

  AuthResponse({
    this.succes,
    this.user,
    this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      succes: json['succes'] as bool?,
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      token: json['Token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'succes': succes,
      'user': user?.toJson(),
      'Token': token,
    };
  }
}


