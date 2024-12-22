import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_colors.dart';

class AppIcons{
  static const String appleIcon = "assets/icon/apple.svg";
  static const String facebookIcon = "assets/icon/facebook.svg";
  static const String googleIcon = "assets/icon/google2.svg";
  static const String injectionIcon = "assets/icon/Injection.svg";
  static const String personIcon = "assets/icon/person_icon.svg";
  static const String iconOnBoarding = "assets/icon/icon_on_boarding.svg";


  static const Icon nameIcon=  Icon(
    Icons.person,
    color: AppColors.thirdColor,
  );
  static const Icon visibilityIcon=  Icon(
    Icons.visibility,
    color: AppColors.thirdColor,
  );
  static const Icon visibilityOffIcon=  Icon(
    Icons.visibility_off,
    color: AppColors.thirdColor,
  );
  static const Icon emailIcon=  Icon(
    Icons.email,
    color: AppColors.thirdColor,
  );
  static const Icon phoneIcon=  Icon(
    Icons.phone,
    color: AppColors.thirdColor,
  );

  static  Widget passwordIcon = Padding(
      padding:  const EdgeInsets.all(12),
      child: SvgPicture.asset("assets/icon/password_icon2.svg"));
}