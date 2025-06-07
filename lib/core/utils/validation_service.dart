import 'package:easy_localization/easy_localization.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';

class Validators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.name_required.tr();
    }
    if (!RegExp(r'^[\u0621-\u064A\u0660-\u0669a-zA-Z\s]+$').hasMatch(value)) {
      return LocaleKeys.name_invalid.tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.email_required.tr();
    }
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
      return LocaleKeys.email_invalid.tr();
    }
    return null; // لا يوجد خطأ
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.password_required.tr();
    }
    if (value.length < 8) {
      return LocaleKeys.password_length.tr();
    }
    if (!RegExp(
            r'^(?=.*[\u0621-\u064Aa-zA-Z])(?=.*\d)[\u0621-\u064A\u0660-\u0669a-zA-Z\d@$!%*?&]+$')
        .hasMatch(value)) {
      return LocaleKeys.password_invalid.tr();
    }
    return null; // لا يوجد خطأ
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return LocaleKeys.confirm_password_required.tr();
    }
    if (password != confirmPassword) {
      return LocaleKeys.confirm_password_mismatch.tr();
    }
    return null; // لا يوجد خطأ
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.phone_number_required.tr();
    }
    if (!RegExp(r'^\+?[0-9\u0660-\u0669]{7,15}$').hasMatch(value)) {
      return LocaleKeys.phone_number_invalid.tr();
    }
    return null; // لا يوجد خطأ
  }
}
