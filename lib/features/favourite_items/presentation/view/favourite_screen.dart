import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/favourite_items/presentation/view/widget/favourite_body.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_text.dart';
import '../viewModel/favourite_items_cubit.dart';

class FavouriteScreen extends StatelessWidget {
  static String id = "FavouriteScreen";

  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteItemsCubit(),
      child:  const Scaffold(
        appBar:   CustomAppBar(
          title: AppText.favoriteItems,
        ),
        body: FavouriteBody(),
      ),
    );
  }

}
