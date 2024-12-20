import 'package:flutter/material.dart';

import '../../../core/shared_widget/global_text.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text.dart';

class HaveOrNotAccountAuth extends StatelessWidget {
  final String titleOnTap;
  final String titleWithoutTap;
  final void Function() onTap;
  const HaveOrNotAccountAuth({super.key, required this.titleOnTap, required this.titleWithoutTap, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GText(color: AppColors.primaryColor, content: titleWithoutTap, fontSize: 16 , fontWeight: FontWeight.w500,),
        const SizedBox(width: 10,),
         InkWell(
             onTap: onTap,
             child: GText(color: AppColors.primaryColor, content: titleOnTap, fontSize: 16 , fontWeight: FontWeight.w900,))
      ],
    );
  }
}
