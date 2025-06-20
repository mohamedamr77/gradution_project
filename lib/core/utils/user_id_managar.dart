import 'package:hive/hive.dart';

import 'const_box.dart';

class UserIdManager {
  static const String  _userIdKey= 'token';
  static Future<void> saveToken({required String userId}) async {
    var authBox = Hive.box(BoxApp.kUserId);
    await authBox.put(_userIdKey,  userId);
  }

  // Get the token
  static String? getToken() {
    var authBox = Hive.box(BoxApp.kUserId);
    return authBox.get(_userIdKey);
  }

  // Clear the token (e.g., on logout)
  static Future<void> clearToken() async {
    var authBox = Hive.box(BoxApp.kUserId);
    await authBox.delete(_userIdKey);
  }
}