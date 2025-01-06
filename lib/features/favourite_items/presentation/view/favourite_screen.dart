import 'package:flutter/material.dart';
import 'package:gradutionproject/features/favourite_items/presentation/view/widget/favourite_body.dart';

import '../../../../core/navigation/navigation_manager.dart';
import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/shared_widget/global_text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text.dart';

class FavouriteScreen extends StatelessWidget {
  static String id = "FavouriteScreen";
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.favoriteItems, onBackPressed: () {
        NavigationManager.goBack();
      },),
      body: FavouriteBody(),
    );
  }
}
