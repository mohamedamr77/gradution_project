import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import '../../../../../core/shared_widget/custom_list_tile.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../data/model/account_list_tile_list.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: CustomScrollView(
        slivers: [
          _buildSpacer(height: 16),
          _buildNameScreen(title: AppText.profile),
          _buildSpacer(height: 16),
          _buildImageUser(imagePath: AppImages.lailaTest),
          _buildSpacer(height: 16),
          _buildListOfItems(),
          _buildSpacer(height: 32),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildSpacer({required double height}) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }
  SliverToBoxAdapter _buildNameScreen({required String title}){
    return SliverToBoxAdapter(
      child: Align(
          alignment: Alignment.center,
          child: GText(color: AppColors.primaryColor, content: title, fontSize: 18)),
    );
  }
  SliverToBoxAdapter _buildImageUser({required String imagePath}){
    return SliverToBoxAdapter(
      child: Align(
          alignment: Alignment.center,
          child: CircleAvatar(
        radius: 0.18.w,
        child: Image.asset(imagePath),
    ),
      ));
  }
  SliverList _buildListOfItems(){
    return SliverList.separated(itemBuilder: (context, index) {
       return CustomListTile(
         title: accountListTilesList[index].title,
         onTap: accountListTilesList[index].onTap,
         imagePath:  accountListTilesList[index].imageLeadingPath,
         colorTitle: index == accountListTilesList.length-1 ?
          AppColors.redColor : AppColors.darkGrayColor,
       );
    },
      separatorBuilder: (BuildContext context, int index) {
      return const SizedBox(height: 24,);
      },
     itemCount: accountListTilesList.length,
    );
  }
}