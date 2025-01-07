import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text.dart';
import '../../../../favourite_items/presentation/view/favourite_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lightGrayColor,

      child: ListView(
        children: [
          DrawerHeader(child: Row(
            textDirection: TextDirection.rtl,
            children: [
              CircleAvatar(
                radius: 0.109.w,
                child: Image.asset(AppImages.lailaTest),
              ),
              const SizedBox(
                width: 8,
              ),
              const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: GText(
                    color: AppColors.darkCharcoalColor,
                    content: AppText.welcomeLily,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ) ),
          const SizedBox(height: 16,),
           Card(
            color: AppColors.lightGrayColor,
            child: ListTile(
              onTap: () {
                NavigationManager.push(FavouriteScreen.id);
              },
              title: const GText(color: AppColors.blackColor, content: AppText.favoriteItems, fontSize: 14),
              trailing: const Icon(Icons.favorite,color: AppColors.primaryColor,),
            ),
          ),
        ],
      ),
    );
  }
}
