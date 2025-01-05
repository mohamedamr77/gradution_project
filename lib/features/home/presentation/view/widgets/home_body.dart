import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/features/home/presentation/view/widgets/service_options_section.dart';
import 'package:gradutionproject/features/home/presentation/view/widgets/time_lefts_section.dart';

import 'feature_home_section.dart';
import 'header_home_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

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
            SliverToBoxAdapter(child: HeaderHomeSection()),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 16,
            )),
            SliverToBoxAdapter(child: ServiceOptionsSection()),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 32,
            )),
            SliverToBoxAdapter(
              child: TimeLeftsSection(),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 32,
            )),
            SliverToBoxAdapter(
              child: FeatureHomeSection(),
            ),
          ],
        ));
  }
}