import 'package:flutter/material.dart';
import 'package:gradutionproject/features/child_information/presentation/view/widgets/child_info_body.dart';

class ChildInfoScreen extends StatelessWidget {
  static const String id ="ChildInfoScreenId";
  const ChildInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChildInfoBody(),
    );
  }
}
