import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';

import '../../../../core/utils/app_colors.dart';
import 'bottom_nav_icon_label_model.dart';

List<BottomNavIconWithLabel> bottomNavIconsList = [
  BottomNavIconWithLabel(
      label: 'الرئيسيه',
      iconSelected: SvgPicture.asset(AppIcons.homeIcon ,color: AppColors.skyBlueColor,),
      iconUnSelected: SvgPicture.asset(AppIcons.homeOutLineIcon , color: AppColors.primaryColor,),
  ),
  BottomNavIconWithLabel(
      label: 'الدكاتره',
      iconSelected: SvgPicture.asset(AppIcons.doctorsIcon ,  color: AppColors.skyBlueColor,),
      iconUnSelected: SvgPicture.asset(AppIcons.doctorsIcon ,color: AppColors.primaryColor,),
  ),
  BottomNavIconWithLabel( label: 'التطعيمات',
    iconSelected: SvgPicture.asset(AppIcons.vaccineIcon , color: AppColors.skyBlueColor),
    iconUnSelected:  SvgPicture.asset(AppIcons.vaccineIcon ,color: AppColors.primaryColor,),
  ),
  BottomNavIconWithLabel(label: 'الاعدادت',
    iconSelected: SvgPicture.asset(AppIcons.accountIcon ,color: AppColors.skyBlueColor),
    iconUnSelected:  SvgPicture.asset(AppIcons.accountIcon ,color: AppColors.primaryColor,),
  ),
];