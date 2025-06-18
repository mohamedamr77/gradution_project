import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/features/doctors/data/model/doctor_model.dart';
import 'package:gradutionproject/features/doctors/presentation/view/doctor_details_screen.dart';
import 'package:gradutionproject/features/doctors/presentation/view_model/doctors_state.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../core/shared_model/resuable_model.dart';
import '../../../../favourite_items/data/model/fav_doctors_list.dart';
import '../../../../../core/utils/locale_keys.g.dart';
import '../../view_model/doctors_cubit.dart';

class DoctorsListWidget extends StatefulWidget {
  const DoctorsListWidget({super.key});

  @override
  State<DoctorsListWidget> createState() => _DoctorsListWidgetState();
}

class _DoctorsListWidgetState extends State<DoctorsListWidget> {

  @override
  void initState() {
    BlocProvider.of<DoctorsCubit>(context).doctorsGetAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final doctorsCubit = BlocProvider.of<DoctorsCubit>(context);
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
        subDescription: LocaleKeys.singleDose.tr(),
        onPressedIconFavourite: () {
          // favDoctorsList[index].isFav = !favDoctorsList[index].isFav;
          // setState(() {});
        },
        isFavourite: false,
        onTapCard: () {
          NavigationManager.push(DoctorDetailsScreen.id);
        },
        isDoctor: true,
        isRating: 5.4,
      ),
    );
  }
}

final List<DoctorModel> dummyDoctors = [
  const DoctorModel(
    userId: 95,
    firstName: "Dr. Moamen",
    lastName: "Hussein",
    imageUrl: null,
    email: "sarah.sssmiitti455@clinic.com",
    phoneNumber: "+201164323554",
    createdAt: "2025-04-01",
    specialization: "Cardiology",
    licenseNumber: "MD-123567",
    verified: null,
  ),
  const DoctorModel(
    userId: 109,
    firstName: "Dr. Sarah",
    lastName: "Smith",
    imageUrl: null,
    email: "sarahh.n0012114@clinic.com",
    phoneNumber: "+201155365566",
    createdAt: "2025-04-04",
    specialization: "Cardiologyyyyyy",
    licenseNumber: "MD-1342567",
    verified: null,
  ),
  const DoctorModel(
    userId: 92,
    firstName: "Dr. Moamen",
    lastName: "Hussein",
    imageUrl: null,
    email: "sarah.sssmiittih01255@clinic.com",
    phoneNumber: "+201164366554",
    createdAt: "2025-04-01",
    specialization: "Cardiologyaaaaa",
    licenseNumber: "MD-123367",
    verified: null,
  ),
];
