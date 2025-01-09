import 'package:flutter/material.dart';
import 'package:gradutionproject/features/favourite_items/data/model/fav_doctors_list.dart';
import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text.dart';
import '../../../../../core/shared_model/resuable_model.dart';
import '../../viewModel/favourite_items_cubit.dart';

class FavListItems extends StatefulWidget {
  final FavouriteItemsCubit cubit;
  const FavListItems({super.key, required this.cubit});

  @override
  State<FavListItems> createState() => _FavListItemsState();
}

class _FavListItemsState extends State<FavListItems> {
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: favDoctorsList.length,
      itemBuilder: (context, index) {
        return AnimatedSwitcher(
            duration: const Duration(milliseconds: 400), // Animation duration
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor:
                      animation, // Resizes the widget during the transition
                  axis: Axis.vertical, // Controls the resizing direction
                  child: child,
                ),
              );
            },
            child: widget.cubit.buttonSelected == 0
                ? listButtonArticles()
                : listButtonDoctors(index: index));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
    );
  }

  Widget listButtonDoctors({required int index}) {
    return ReusableItemCard(
      key: const ValueKey<int>(1),
      reusableModel: ReusableModel(
        imagePath: favDoctorsList[index].imagePath,
        title: favDoctorsList[index].name,
        description: favDoctorsList[index].description,
        subDescription: "يتم اخده مره واحده",
        onPressedIconFavourite: () {
          favDoctorsList[index].isFav =! favDoctorsList[index].isFav;
          setState(() {});
        },
        isFavourite : favDoctorsList[index].isFav,
        onTapCard: () {},
        isDoctor: true,
        isRating: favDoctorsList[index].rate,
      ),
    );
  }

  Widget listButtonArticles() {
    return ReusableItemCard(
      key: const ValueKey<int>(0),
      reusableModel: ReusableModel(
        imagePath: AppImages.tuberVaccineTest,
        title: AppText.sideEffectsTuberculosisVaccine,
        description: "فعال بنسبة99%",
        subDescription: "يتم اخده مره واحده",
        onPressedIconFavourite: () {},
        onTapCard: () {},
      ), // Assign a unique key for animation

    );
  }
}
