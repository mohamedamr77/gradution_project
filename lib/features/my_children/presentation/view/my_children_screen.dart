import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_app_bar.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/features/my_children/presentation/view/widgets/my_children_body.dart';

class MyChildrenScreen extends StatelessWidget {
  static String id = "my_children_screen";
  const MyChildrenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: AppText.myChildren),
      body: MyChildrenBody(),
    );
  }
}
