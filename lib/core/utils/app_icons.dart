import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import 'app_colors.dart';

class AppIcons{
  static const String appleIcon = "assets/icon/apple.svg";
  static const String accountIcon = "assets/icon/accountIcon.svg";
  static const String doctorsIcon = "assets/icon/doctorsIcon.svg";
  static const String homeIcon = "assets/icon/homeIcon.svg";
  static const String homeOutLineIcon = "assets/icon/home_out_line.svg";
  static const String  notificationIcon= "assets/icon/notificanIcon.svg";
  static const String drawerIcon = "assets/icon/drawerIcon.svg";
  static const String vaccineIcon = "assets/icon/vaccineIcon.svg";
  static const String facebookIcon = "assets/icon/facebook.svg";
  static const String googleIcon = "assets/icon/google2.svg";
  static const String injectionIcon = "assets/icon/Injection.svg";
  static const String personIcon = "assets/icon/person_icon.svg";
  static const String iconOnBoarding = "assets/icon/icon_on_boarding.svg";
  static const String emojiIcon = "assets/icon/emoji.svg";
  static  Icon cameraIcon = Icon(Icons.photo_camera_outlined,size: 0.08.w,color: AppColors.blackColor,);
  static const  Icon dateIcon =   Icon(
    Icons.date_range,
    color: AppColors.thirdColor,
  );



  static const Icon nameIcon=  Icon(
    Icons.person,
    color: AppColors.thirdColor,
  );
  static const Icon visibilityIcon=  Icon(
    Icons.visibility,
    color: AppColors.primaryColor,
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

  static const Icon navigateIcon=   Icon(
    Icons.arrow_back_ios,
    color: AppColors.primaryColor,
    size: 24,
  );

  static  Widget passwordIcon = Padding(
      padding:  const EdgeInsets.all(12),
      child: SvgPicture.asset("assets/icon/password_icon2.svg"));
}