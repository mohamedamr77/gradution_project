import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:hive/hive.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 16),
      child: Column(
           children: [
             Row(
               children: [
                  CircleAvatar(
                    radius: 0.109.w,
                    child: Image.asset(AppImages.lailaTest),
                  ),
                  const SizedBox(width: 8,),
                  const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: GText(color: AppColors.primaryColor, content: AppText.welcomeLily, fontSize: 16, fontWeight: FontWeight.w600,)),
                   const Spacer(),
                    InkWell(
                        onTap: () {

                        },
                        child: SvgPicture.asset(AppIcons.notificationIcon)),
                    SizedBox(width: 0.09.w,),
                    InkWell(
                        onTap: () {

                        },
                        child: SvgPicture.asset(AppIcons.drawerIcon)),

               ],
             ),
             const SizedBox(height: 16,),
             Row(
               children: [
                 Expanded(
                   child: Container(
                     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(
                         color:Color(0xff808080).withOpacity(0.5),
                       ),
                     ),
                     child: Row(
                       children: [
                          Icon(Icons.message ,color: Color(0xff808080).withOpacity(0.6), ),
                         const SizedBox(width: 8),
                         Flexible(
                           child: GText(
                             color: Color(0xff808080),
                             content: AppText.geminiAnswerPrompt,
                             fontSize: 9,

                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                 const SizedBox(width: 16),
                 Expanded(
                   child: Container(
                     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(
                         color: AppColors.thirdColor,
                       ),
                     ),
                     child: Row(
                       children: [
                         const Icon(Icons.message),
                         const SizedBox(width: 8),
                         Flexible(
                           child: GText(
                             color: AppColors.thirdColor,
                             content: AppText.geminiAnswerPrompt,
                             fontSize: 9,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             )

           ],
      ),
    );
  }
}
