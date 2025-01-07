class Validators {
  /// التحقق من الاسم (يجب ألا يكون فارغًا ويحتوي فقط على حروف عربية أو إنجليزية ومسافات)
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الاسم مطلوب';
    }
    if (!RegExp(r'^[\u0621-\u064A\u0660-\u0669a-zA-Z\s]+$').hasMatch(value)) {
      return 'الاسم يجب أن يحتوي على حروف عربية أو إنجليزية فقط';
    }
    return null; // لا يوجد خطأ
  }

  /// التحقق من البريد الإلكتروني
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
      return 'الرجاء إدخال بريد إلكتروني صحيح';
    }
    return null; // لا يوجد خطأ
  }

  /// التحقق من كلمة المرور (حد أدنى 8 أحرف، على الأقل رقم واحد وحرف واحد عربي أو إنجليزي)
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    }
    if (!RegExp(
            r'^(?=.*[\u0621-\u064Aa-zA-Z])(?=.*\d)[\u0621-\u064A\u0660-\u0669a-zA-Z\d@$!%*?&]+$')
        .hasMatch(value)) {
      return 'كلمة المرور يجب أن تحتوي على حرف واحد (عربي أو إنجليزي) ورقم واحد على الأقل';
    }
    return null; // لا يوجد خطأ
  }

  /// التحقق من تأكيد كلمة المرور
  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'تأكيد كلمة المرور مطلوب';
    }
    if (password != confirmPassword) {
      return 'كلمة المرور وتأكيد كلمة المرور غير متطابقتين';
    }
    return null; // لا يوجد خطأ
  }

  /// التحقق من رقم الهاتف (يدعم الأرقام العربية والإنجليزية)
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'رقم الهاتف مطلوب';
    }
    if (!RegExp(r'^\+?[0-9\u0660-\u0669]{7,15}$').hasMatch(value)) {
      return 'الرجاء إدخال رقم هاتف صحيح';
    }
    return null; // لا يوجد خطأ
  }
}
