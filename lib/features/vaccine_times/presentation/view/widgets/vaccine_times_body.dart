import 'package:flutter/material.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/view/widgets/vaccine_times_buttons.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/view/widgets/vaccine_times_list_items.dart';

import '../../../../../core/shared_widget/header_home_section.dart';

class VaccineTimesBody extends StatelessWidget {
  const VaccineTimesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HeaderBottomNavBarScreen()),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          VaccineTimesButtons(),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          VaccineTimesListItems(),
        ],
      ),
    );
  }
}
