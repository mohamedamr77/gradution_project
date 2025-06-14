class AppEndPoint{
  static const String baseUrl ="https://baby-tracker.koyeb.app";
  static const String domain = "$baseUrl/api/v1";
  static const String signUp = "$domain/Auth/userRegister";
  static const String login = "$domain/Auth/login";
  static const String articleGetAll = "$domain/article/getAll";

  static String getArticleById({required String id}) {
    return "$domain/article/articleById/$id";
  }

  static String searchArticle({required String search}) {
    return "$domain/article/search?title=$search";
  }
  static const String forgetPassword = "$domain/auth/forgotPassword";
  // static const String getAllMedicine = "$domain/medicine/getAll";
  static String searchMedicine(String name) {
    return "$domain/medicine/search?name=$name";
  }
  static String getMedicineById(String id) {
    return "$domain/medicine/medicineById/$id";
  }
}