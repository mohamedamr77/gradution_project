import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/view/widgets/vaccine_info_buttons.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/view/widgets/vaccine_info_list_item.dart';

class VaccineInfoBody extends StatelessWidget {
  const VaccineInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: const CustomScrollView(
        slivers: [
          VaccineInfoButtons(),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          VaccineInfoListItem(),
        ],
      ),
    );
  }
}
