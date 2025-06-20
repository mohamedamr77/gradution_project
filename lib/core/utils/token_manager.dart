import 'package:hive/hive.dart';

import 'const_box.dart';

class TokenManager {
  static const String _tokenKey = 'token';

  // Save the token
  static Future<void> saveToken(String token) async {
    var authBox = Hive.box(BoxApp.kAuthBox);
    await authBox.put(_tokenKey, token);
  }

  // Get the token
  static String? getToken() {
    var authBox = Hive.box(BoxApp.kAuthBox);
    return authBox.get(_tokenKey);
  }

  // Clear the token (e.g., on logout)
  static Future<void> clearToken() async {
    var authBox = Hive.box(BoxApp.kAuthBox);
    await authBox.delete(_tokenKey);
  }
}