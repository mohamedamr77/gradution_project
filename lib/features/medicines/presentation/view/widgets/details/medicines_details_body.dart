import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicine_by_id/medicine_by_id_cubit.dart';

import '../../../../../../core/shared_widget/custom_title_text.dart';
import '../../../../../../core/shared_widget/global_text.dart';
import '../../../../../../core/shared_widget/reusable_item_card .dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/locale_keys.g.dart';
import '../../../../../../core/shared_model/resuable_model.dart';

class MedicinesDetailsBody extends StatefulWidget {
  final String medicineId;
  const MedicinesDetailsBody({super.key, required this.medicineId});

  @override
  State<MedicinesDetailsBody> createState() => _MedicinesDetailsBodyState();
}

class _MedicinesDetailsBodyState extends State<MedicinesDetailsBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MedicineByIdCubit>(context).getMedicineById(id: widget.medicineId);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          _buildReusableItemCard(),
          _buildSpacer(height: 24),
          _buildSectionTitle(LocaleKeys.healthNote.tr()),
          _buildSpacer(height: 16),
          _buildTipsDescription(LocaleKeys.loremIpsumExample1.tr()),
          _buildSpacer(height: 24),
          _buildSectionTitle(LocaleKeys.recommendedMedications.tr()),
          _buildSpacer(height: 16),
          _buildTipsDescription(LocaleKeys.loremIpsumExample1.tr()),
        ],
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
          subDescription: LocaleKeys.singleDose.tr(),
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

  _buildTipsDescription(String description) {
    return SliverToBoxAdapter(
      child: GText(
        color: AppColors.mediumGrayColor,
        content: description,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
