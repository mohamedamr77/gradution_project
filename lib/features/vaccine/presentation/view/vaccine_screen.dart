import 'package:flutter/material.dart';
import 'package:gradutionproject/features/vaccine/presentation/view/widgets/vaccine_body.dart';

class VaccineScreen extends StatelessWidget {
  const VaccineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VaccineBody(),
    );
  }
}
