
import 'package:gradutionproject/features/auth/sign_up/data/model/user_model.dart';

class SignUpResponse {
  final bool? succes;
  final UserModel? user;
  final String? token;

  SignUpResponse({
    this.succes,
    this.user,
    this.token,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
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


