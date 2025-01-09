import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/features/doctors/presentation/view/doctor_details_screen.dart';
import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/shared_model/resuable_model.dart';
import '../../../../favourite_items/data/model/fav_doctors_list.dart';

class DoctorsListWidget extends StatefulWidget {
  const DoctorsListWidget({super.key});

  @override
  State<DoctorsListWidget> createState() => _DoctorsListWidgetState();
}

class _DoctorsListWidgetState extends State<DoctorsListWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return listButtonDoctors(index: index);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 16,
        );
      },
      itemCount: favDoctorsList.length,
    );
  }

  Widget listButtonDoctors({required int index}) {
    return ReusableItemCard(
      reusableModel: ReusableModel(
        imagePath: favDoctorsList[index].imagePath,
        title: favDoctorsList[index].name,
        description: favDoctorsList[index].description,
        subDescription: "يتم اخده مره واحده",
        onPressedIconFavourite: () {
          favDoctorsList[index].isFav = !favDoctorsList[index].isFav;
          setState(() {});
        },
        isFavourite: favDoctorsList[index].isFav,
        onTapCard: () {
          NavigationManager.push(DoctorDetailsScreen.id);
        },
        isDoctor: true,
        isRating: favDoctorsList[index].rate,
      ),
    );
  }
}
