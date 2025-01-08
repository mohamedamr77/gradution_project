import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../utils/app_colors.dart';

class CustomRowButtons extends StatelessWidget {
  final String titleBlueButton;
  final void Function() onTapBlueButton;

  final String titleWhiteButton;
  final void Function() onTapWhiteButton;
  const CustomRowButtons(
      {super.key,
      required this.titleBlueButton,
      required this.onTapBlueButton,
      required this.titleWhiteButton,
      required this.onTapWhiteButton});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomElevatedButton(
          width: 0.42.w,
          btnColor: AppColors.primaryColor,
          onPress: onTapBlueButton,
          titleButton: titleBlueButton,
        ),
        CustomElevatedButton(
          width: 0.42.w,
          titleColor: AppColors.primaryColor,
          btnColor: AppColors.secondaryColor,
          onPress: onTapWhiteButton,
          titleButton: titleWhiteButton,
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}

/*
Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 0.42.w,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: index == buttonSelectedIndex
                ? AppColors.primaryColor
                : AppColors.secondaryColor,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: GText(
              color: index == buttonSelectedIndex
                  ? AppColors.whiteColor
                  : AppColors.primaryColor,
              content: buttonNames[index],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
 */
