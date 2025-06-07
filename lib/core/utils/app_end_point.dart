class AppEndPoint{
  static const String baseUrl ="https://baby-tracker.koyeb.app";
  static const String domain = "$baseUrl/api/v1";
  static const String signUp = "$domain/Auth/userRegister";
  static const String login = "$domain/Auth/login";
  static const String forgetPassword = "$domain/auth/forgotPassword";
  // static const String getAllMedicine = "$domain/medicine/getAll";
  static String searchMedicine(String name) {
    return "$domain/medicine/search?name=$name";
  }

}