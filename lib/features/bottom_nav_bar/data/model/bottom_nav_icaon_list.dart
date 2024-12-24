import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'bottom_nav_icon_label_model.dart';

List<BottomNavIconWithLabel> bottomNavIconsList = [
  BottomNavIconWithLabel(
      label: 'الرئيسيه',
      iconSelected: const Icon(Icons.home , color: AppColors.whiteColor, ),
      iconUnSelected: const Icon(Icons.home_outlined ,  color: AppColors.whiteColor)
  ),
  BottomNavIconWithLabel(
      label: 'المفضله',
      iconSelected: const Icon(Icons.favorite,  color: AppColors.whiteColor),
      iconUnSelected: const Icon(Icons.favorite_border,  color: AppColors.whiteColor)
  ),
  BottomNavIconWithLabel( label: 'السله',
    iconSelected: const Icon(Icons.shopping_basket ,  color: AppColors.whiteColor),
    iconUnSelected:  const Icon(Icons.shopping_basket_outlined ,  color: AppColors.whiteColor),
  ),
  BottomNavIconWithLabel(label: 'الاعدادت',
    iconSelected: const Icon(Icons.settings , color: AppColors.whiteColor),
    iconUnSelected:  const Icon(Icons.settings_outlined , color: AppColors.whiteColor),
  ),
];