import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/home/presentation/view/widgets/service_options_section.dart';
import 'package:hive/hive.dart';

import 'header_home_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 16),
      child: Column(
           children: [
             HeaderHomeSection(),
             SizedBox(height: 16,),
             ServiceOptionsSection(),
             SizedBox(height: 32,),
             Align(
               alignment: Alignment.centerRight,
               child: GText(
                 textAlign: TextAlign.right,
                 color: AppColors.primaryColor, content: AppText.vaccinationTimeRemaining, fontSize: 16, fontWeight: FontWeight.w600,),
             ),

           ],
      ),
    );
  }
}
