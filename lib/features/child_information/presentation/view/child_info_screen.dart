import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/features/child_information/presentation/view/widgets/child_info_body.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_informtion_cubit.dart';

import '../../data/repo/child_info_impl.dart';

class ChildInfoScreen extends StatelessWidget {
  static const String id = "ChildInfoScreenId";

  const ChildInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChildInformationCubit(ChildInfoImpl(apiService: ApiService())),
      child: const Scaffold(
        body: ChildInfoBody(),
      ),
    );
  }
}
