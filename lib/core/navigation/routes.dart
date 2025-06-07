import 'package:flutter/material.dart';
import '../../features/auth/login/presentation/view/login_screen.dart';
import '../../features/auth/sign_up/presentation/view/sign_up_screen.dart';
import '../../features/bottom_nav_bar/presentation/view/bottom_nav_bar_screen.dart';
import '../../features/child_information/presentation/view/child_info_screen.dart';
import '../../features/doctors/presentation/view/doctor_details_screen.dart';
import '../../features/favourite_items/presentation/view/favourite_screen.dart';
import '../../features/forget_password/presentation/view/change_pass_done_screen.dart';
import '../../features/forget_password/presentation/view/change_pass_screen.dart';
import '../../features/forget_password/presentation/view/forget_pass_screen.dart';
import '../../features/forget_password/presentation/view/verify_code_screen.dart';
import '../../features/gemini_health/presentation/view/gemini_health_screen.dart';
import '../../features/language_app/presentation/view/language_screen.dart';
import '../../features/medicines/presentation/view/medicines_deatils_screen.dart';
import '../../features/medicines/presentation/view/medicines_screen.dart';
import '../../features/my_children/presentation/view/my_children_screen.dart';
import '../../features/notification_feature/presentation/view/noificaion_screen.dart';
import '../../features/notification_feature/presentation/view/notification_details_screen.dart';
import '../../features/on_boarding/presentation/view/on_boarding_screen.dart';
import '../../features/profile_setting/presentation/view/profile_setting_screen.dart';
import '../../features/side_effects/presentation/view/side_effect_details_screen.dart';
import '../../features/side_effects/presentation/view/side_effect_screen.dart';
import '../../features/theme_app/presentation/view/theme_screen.dart';
import '../../features/vaccination_tips/presentation/view/vaccination_tips_screen.dart';
import '../../features/vaccination_tips/presentation/view/vaccine_tips_details_screen.dart';
import '../../features/vaccine_info/presentation/view/vaccine_info_details_screen.dart';
import '../../features/vaccine_info/presentation/view/vaccine_info_screen.dart';
import '../../features/vaccine_times/presentation/view/vaccine_times_deatils_screen.dart';

class AppRouter {
  static Map<String, Widget Function(dynamic)> routes = {
    OnBoardingScreen.id: (context) => const OnBoardingScreen(),
    SignUpScreen.id: (context) => const SignUpScreen(),
    LoginScreen.id: (context) => const LoginScreen(),
    ForgetPassScreen.id: (context) => const ForgetPassScreen(),
    GeminiHealthScreen.id: (context) => const GeminiHealthScreen(),
    VerifyCodeScreen.id: (context) => const VerifyCodeScreen(),
    ChangePasswordScreen.id: (context) => const ChangePasswordScreen(),
    ChangePassDoneScreen.id: (context) => const ChangePassDoneScreen(),
    ChildInfoScreen.id: (context) => const ChildInfoScreen(),
    BottomNavBarScreen.id: (context) => const BottomNavBarScreen(),
    FavouriteScreen.id: (context) => const FavouriteScreen(),
    VaccinationTipsScreen.id: (context) => const VaccinationTipsScreen(),
    SideEffectScreen.id: (context) => const SideEffectScreen(),
    VaccineInfoScreen.id: (context) => const VaccineInfoScreen(),
    MedicinesScreen.id: (context) => const MedicinesScreen(),
    VaccineTipsDetailsScreen.id: (context) => const VaccineTipsDetailsScreen(),
    SideEffectDetailsScreen.id: (context) => const SideEffectDetailsScreen(),
    VaccineInfoDetailsScreen.id: (context) => const VaccineInfoDetailsScreen(),
    MedicinesDetailsScreen.id: (context) => const MedicinesDetailsScreen(),
    DoctorDetailsScreen.id: (context) => const DoctorDetailsScreen(),
    ProfileSettingScreen.id: (context) => const ProfileSettingScreen(),
    VaccineTimesDetailsScreen.id: (context) =>
        const VaccineTimesDetailsScreen(),
    LanguageScreen.id: (context) => const LanguageScreen(),
    ThemeScreen.id: (context) => const ThemeScreen(),
    NotificationScreen.id: (context) => const NotificationScreen(),
    NotificationDetailsScreen.id: (context) =>
        const NotificationDetailsScreen(),
    MyChildrenScreen.id: (context) => const MyChildrenScreen(),
  };
}
