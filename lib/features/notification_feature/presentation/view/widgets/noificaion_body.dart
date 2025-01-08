import 'package:flutter/material.dart';


class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [

      ],
    );
  }
  SliverToBoxAdapter _builderSpacer({required double height}){
    return SliverToBoxAdapter(child: SizedBox(height:  height,));
  }
}
