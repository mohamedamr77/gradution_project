import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/features/doctors/data/model/doctor_model.dart';
import 'package:gradutionproject/features/doctors/presentation/view/doctor_details_screen.dart';
import 'package:gradutionproject/features/doctors/presentation/view_model/doctors_state.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/shared_model/resuable_model.dart';
import '../../../data/model/dummy_doctors.dart';
import '../../view_model/doctors_cubit.dart';

class DoctorsListWidget extends StatefulWidget {
  const DoctorsListWidget({super.key});

  @override
  State<DoctorsListWidget> createState() => _DoctorsListWidgetState();
}

class _DoctorsListWidgetState extends State<DoctorsListWidget> {



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsState>(
      builder: (context, state) {
        List<DoctorModel> doctorsList =
            state is DoctorsSuccessState
                ? state.doctors ?? []
                : dummyDoctors;
        if (state is DoctorsErrorState) {
          return Center(
            child: Text(state.message),
          );
        }
        return SliverList.separated(
          itemBuilder: (context, index) {
            return Skeletonizer(
                enabled: state is DoctorsLoadingState,
                child: listButtonDoctors(doctorModel: doctorsList[index]));
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 16,
            );
          },
          itemCount: doctorsList.length,
        );
      },
    );
  }

  Widget listButtonDoctors({required DoctorModel doctorModel}) {
    return ReusableItemCard(
      reusableModel: ReusableModel(
        imagePath: AppImages.doctorAyaTest,
        title: doctorModel.firstName??"",
        description: doctorModel.specialization??"",
        subDescription: doctorModel.phoneNumber??"",
        onPressedIconFavourite: () {
          // favDoctorsList[index].isFav = !favDoctorsList[index].isFav;
          // setState(() {});
        },
        isFavourite: false,
        onTapCard: () {
          NavigationManager.push(DoctorDetailsScreen.id,
          arguments: {
            'doctorId': doctorModel.userId.toString() ,
          }
          );
        },
        isDoctor: true,
        isRating: 5.4,
      ),
    );
  }
}

