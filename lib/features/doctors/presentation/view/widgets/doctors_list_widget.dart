import 'package:flutter/material.dart';
import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/utils/app_images.dart';

class DoctorsListWidget extends StatelessWidget {
  const DoctorsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   SliverList.separated(
      itemBuilder: (context, index) {
      return listButtonDoctors();
    },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16,);
      },
      itemCount: 10,
    );
  }
  Widget listButtonDoctors() {
    return ReusableItemCard(
      imagePath: AppImages.doctorAmrTest,
      title: "د / محمد عمرو",
      description: "اخصائى اطفال",
      subDescription: "يتم اخده مره واحده",
      onPressedIconFavourite: () {},
      onTapCard: () {},
      isDoctor: true,
      isRating: 4.5,
    );
  }
}
