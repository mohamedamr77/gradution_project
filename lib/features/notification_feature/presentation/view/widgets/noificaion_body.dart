import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';


class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          _buildRowOfText(),
          _builderSpacer(height: 24),
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Card(
                    color: AppColors.lightGrayColor,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20,top: 10),
                      child: ListTile(
                        trailing: CircleAvatar(
                          backgroundColor: AppColors.lightGrayColor5,
                          child: SvgPicture.asset(AppIcons.injectionIcon),
                        ),
                        title: const GText(
                          color: Color(0xff1A1E4C),
                          content: "موعد تطعيم الدرن",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                    
                        ),
                        subtitle: const GText(color: AppColors.grayColor1,
                            content: "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها",
                            fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  // Positioned(child: IconButton(onPressed: () {
                  //
                  // }, icon: Icon(Icons.false)))
                ],
              ),
            )
        ],
      ),
    );
  }
  SliverToBoxAdapter _builderSpacer({required double height}){
    return SliverToBoxAdapter(child: SizedBox(height:  height,));
  }

  SliverToBoxAdapter _buildRowOfText(){
    return  SliverToBoxAdapter(
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const GText(color: AppColors.thirdColor, content: AppText.today, fontSize: 14, fontWeight: FontWeight.w500,),
          TextButton(
              onPressed: () {},
              child: GText(color: AppColors.primaryColor, content: AppText.markAsRead, fontSize: 14, fontWeight: FontWeight.w500,))
        ],
      ),
    );
  }


}
