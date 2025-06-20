import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/shared_widget/custom_title_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/doctors/presentation/view_model/doctors_cubit.dart';
import 'package:gradutionproject/features/doctors/presentation/view_model/doctors_state.dart';

import '../../../../../../core/shared_widget/custom_description_text.dart';
import '../../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../auth/shared_widget_auth/social_auth_section.dart';
import '../../../../../../core/shared_model/resuable_model.dart';
import '../../../../../../core/utils/locale_keys.g.dart';

class DoctorDetailsBody extends StatefulWidget {
  final String id;

  const DoctorDetailsBody({super.key, required this.id});

  @override
  State<DoctorDetailsBody> createState() => _DoctorDetailsBodyState();
}

class _DoctorDetailsBodyState extends State<DoctorDetailsBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<DoctorsCubit>(context).getDoctorById(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsState>(
      builder: (context, state) {
        return state is GetDoctorByIdLoadingState
            ? const Center(child: CircularProgressIndicator())
            : state is GetDoctorByIdErrorState
                ? Center(child: Text(state.message))
                : state is GetDoctorByIdSuccessState
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.04.w, vertical: 0.02.h),
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: ReusableItemCard(
                                reusableModel: ReusableModel(
                                  imagePath: AppImages.doctorAmrTest,
                                  title: "${state.doctor.firstName} ${state.doctor.lastName}" ,
                                  description: state.doctor.specialization?? LocaleKeys.unAvailable.tr(),
                                  subDescription: LocaleKeys.singleDose.tr(),
                                  onPressedIconFavourite: () {},
                                  onTapCard: () {},
                                  isDoctor: true,
                                  isRating: 5.4,
                                  isDetails: true,
                                ),
                              ),
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(
                                height: 32,
                              ),
                            ),
                            SliverToBoxAdapter(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SocialContainerItem(
                                  onTap: () {},
                                  iconPath: AppIcons.facebookIcon,
                                ),
                                SocialContainerItem(
                                  onTap: () {},
                                  iconPath: AppImages.whatsImage,
                                ),
                                SocialContainerItem(
                                  onTap: () {},
                                  iconPath: AppImages.phoneImage,
                                ),
                              ],
                            )),
                            const SliverToBoxAdapter(
                              child: SizedBox(
                                height: 32,
                              ),
                            ),
                            SliverToBoxAdapter(
                                child: CustomTitleText(
                                    title: LocaleKeys.doctorDetails.tr())),
                            const SliverToBoxAdapter(
                              child: SizedBox(
                                height: 16,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: CustomDescriptionText(
                                title: LocaleKeys.doctorDescription.tr(),
                              ),
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(
                                height: 24,
                              ),
                            ),
                            SliverToBoxAdapter(
                                child: CustomTitleText(
                                    title: LocaleKeys.workHours.tr())),
                            const SliverToBoxAdapter(
                              child: SizedBox(
                                height: 16,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: CustomDescriptionText(
                                title: LocaleKeys.workSchedule.tr(),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox();
      },
    );
  }
}
