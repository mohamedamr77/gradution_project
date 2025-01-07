import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/view/widgets/vaccine_times_body.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/viewModel/vaccine_times_cubit.dart';

class VaccineTimesScreen extends StatelessWidget {
  const VaccineTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VaccineTimesCubit(),
      child: const VaccineTimesBody(),
    );
  }
}
