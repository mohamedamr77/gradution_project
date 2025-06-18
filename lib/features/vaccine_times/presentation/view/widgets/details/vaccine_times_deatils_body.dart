import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/shared_widget/custom_description_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/shared_model/resuable_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/viewModel/vaccine_cubit/vaccine_cubit.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/viewModel/vaccine_cubit/vaccine_state.dart';
import '../../../../../../core/utils/locale_keys.g.dart';

import '../../../../../../core/shared_widget/custom_title_text.dart';
import '../../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../../core/utils/app_images.dart';

class VaccineTimesDetailsBody extends StatefulWidget {
  final String id;

  const VaccineTimesDetailsBody({super.key, required this.id});

  @override
  State<VaccineTimesDetailsBody> createState() =>
      _VaccineTimesDetailsBodyState();
}

class _VaccineTimesDetailsBodyState extends State<VaccineTimesDetailsBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<VaccineCubit>(context).getVaccineById(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: BlocBuilder<VaccineCubit, VaccineState>(
        builder: (context, state) {
          return
              state is VaccineDetailsLoadingState ?
              const Center(child: CircularProgressIndicator())
          : state is VaccineDetailsErrorState ?
          Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ) :
                  state is VaccineDetailsSuccessState ?
          CustomScrollView(
            slivers: [
              _buildReusableItemCard(),
              _buildSpacer(height: 24),
              _buildSectionTitle(LocaleKeys.doseCount.tr()),
              _buildSpacer(height: 16),
              _buildSectionDescription("جرعتان أو ثلاث (حسب نوع اللقاح)."),
              _buildSpacer(height: 24),
              _buildSectionTitle(LocaleKeys.timeline.tr()),
              _buildSpacer(height: 16),
              _buildSectionDescription(LocaleKeys.timeLineDetails.tr()),
              _buildSpacer(height: 24),
              _buildSectionTitle(LocaleKeys.sideEffectsLabel.tr()),
              _buildSpacer(height: 16),
              _buildSectionDescription(LocaleKeys.sideEffectDetails.tr()),
              _buildSpacer(height: 24),
              _buildSectionTitle(LocaleKeys.medicationsForSideEffects.tr()),
              _buildSpacer(height: 16),
              _buildSectionDescription(
                  LocaleKeys.medicationsForSideEffectsDetails.tr())
            ],
          ) : const SizedBox();
        },
      ),
    );
  }

  SliverToBoxAdapter _buildReusableItemCard() {
    return SliverToBoxAdapter(
      child: ReusableItemCard(
        reusableModel: ReusableModel(
          imagePath: AppImages.tuberVaccineTest,
          title: LocaleKeys.rotavirusVaccine.tr(),
          description: "فعال بنسبة99%",
          subDescription: "يتم اخده مره واحده",
          onPressedIconFavourite: () {},
          onTapCard: () {},
          isDetails: true,
        ),
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

  SliverToBoxAdapter _buildSectionTitle(String title) {
    return SliverToBoxAdapter(
      child: CustomTitleText(title: title),
    );
  }

  SliverToBoxAdapter _buildSectionDescription(String title) {
    return SliverToBoxAdapter(
      child: CustomDescriptionText(title: title),
    );
  }
}
