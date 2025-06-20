import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/shared_widget/custom_list_tile.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/locale_keys.g.dart';
import '../../../data/model/account_list_tile_list.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: CustomScrollView(
        slivers: [
          _buildSpacer(height: 16),
          _buildNameScreen(title: LocaleKeys.profile.tr()),
          _buildSpacer(height: 16),
          _buildImageUser(imagePath: AppImages.lailaTest),
          _buildSpacer(height: 16),
          SliverList.separated(
            itemBuilder: (context, index) {
              return CustomListTile(
                title: accountListTilesList[index].title.tr(),
                onTap: accountListTilesList[index].onTap,
                imagePath: accountListTilesList[index].imageLeadingPath,
                colorTitle: index == accountListTilesList.length - 1
                    ? AppColors.redColor
                    : AppColors.darkGrayColor,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 24,
              );
            },
            itemCount: accountListTilesList.length,
          ),
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

  SliverToBoxAdapter _buildNameScreen({required String title}) {
    return SliverToBoxAdapter(
      child: Align(
          alignment: Alignment.center,
          child: GText(
              color: AppColors.primaryColor, content: title.tr(), fontSize: 18)),
    );
  }

  SliverToBoxAdapter _buildImageUser({required String imagePath}) {
    return SliverToBoxAdapter(
        child: Align(
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: 0.18.w,
        child: Image.asset(imagePath),
      ),
    ));
  }

  SliverList _buildListOfItems() {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return CustomListTile(
          title: accountListTilesList[index].title.tr(),
          onTap: accountListTilesList[index].onTap,
          imagePath: accountListTilesList[index].imageLeadingPath,
          colorTitle: index == accountListTilesList.length - 1
              ? AppColors.redColor
              : AppColors.darkGrayColor,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 24,
        );
      },
      itemCount: accountListTilesList.length,
    );
  }
}
