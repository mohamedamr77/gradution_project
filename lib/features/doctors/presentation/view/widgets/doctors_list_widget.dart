import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/features/doctors/presentation/view/doctor_details_screen.dart';
import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/shared_model/resuable_model.dart';

class DoctorsListWidget extends StatelessWidget {
  const DoctorsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return listButtonDoctors();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 16,
        );
      },
      itemCount: 10,
    );
  }

  Widget listButtonDoctors() {
    return ReusableItemCard(

      reusableModel: ReusableModel(
        imagePath: AppImages.doctorAmrTest,
        title: "د / محمد عمرو",
        description: "اخصائى اطفال",
        subDescription: "يتم اخده مره واحده",
        onPressedIconFavourite: () {},
        onTapCard: () {
          NavigationManager.push(DoctorDetailsScreen.id);
        },
        isDoctor: true,
        isRating: 4.5,
      ),
    );
  }
}
