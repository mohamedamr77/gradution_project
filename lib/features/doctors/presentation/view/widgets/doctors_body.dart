import 'package:flutter/cupertino.dart';
import 'package:gradutionproject/features/doctors/presentation/view/widgets/doctors_list_widget.dart';
import '../../../../../core/shared_widget/header_home_section.dart';

class DoctorsBody extends StatelessWidget {
  const DoctorsBody({super.key});

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
          SliverToBoxAdapter(child: SizedBox(height: 32,)),
          DoctorsListWidget(),
        ],
      ),
    );
  }
}