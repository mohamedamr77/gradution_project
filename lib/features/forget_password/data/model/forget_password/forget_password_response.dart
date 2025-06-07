
class ForgetPasswordResponse {
  final bool success;
  final String message;
  final String token;

  ForgetPasswordResponse({
    required this.success,
    required this.message,
    required this.token,
  });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      success: json['success'],
      message: json['message'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'token': token,
    };
  }
}
