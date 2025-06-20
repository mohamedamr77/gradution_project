import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/features/child_information/presentation/view/widgets/child_info_body.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_information_state.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_informtion_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/repo/child_info_impl.dart';

class ChildInfoScreen extends StatelessWidget {
  static const String id = "ChildInfoScreenId";

  const ChildInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChildInformationCubit(ChildInfoImpl(apiService: ApiService())),
      child:  Stack(
        children: [
          const Scaffold(
            body: ChildInfoBody(),
          ),
          BlocBuilder<ChildInformationCubit,ChildInformationState>(
            builder: (context, state) {
              if (state is ChildInformationLoadingState) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.black12,
                  child: const CircularProgressIndicator(
                    color:  AppColors.primaryColor,
                  ),
                );
              }else {
                return const SizedBox();
              }
            },)
        ],
      ),
    );
  }
}
