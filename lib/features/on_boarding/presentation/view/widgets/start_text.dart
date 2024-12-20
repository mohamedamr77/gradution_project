import 'package:flutter/material.dart';
import 'package:gradutionproject/features/on_boarding/data/on_boarding_list.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text.dart';

class StartText extends StatelessWidget {
  final int index;
  const StartText({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return   Visibility(
      visible: index == onBoardingList.length-1,
      child: const Padding(
        padding: EdgeInsets.only(top: 18),
        child: GText(
          textDirection: TextDirection.rtl,
          color: AppColors.primaryColor,
          content: AppText.readyToStart,
          fontSize: 22,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
