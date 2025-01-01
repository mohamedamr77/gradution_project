import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/auth/login/presentation/viewModel/login_cubit.dart';
import 'package:gradutionproject/features/auth/login/presentation/viewModel/login_state.dart';
import 'package:rive/rive.dart';

class RiverImageLogin extends StatefulWidget {
  const RiverImageLogin({super.key});

  @override
  State<RiverImageLogin> createState() => _RiverImageLoginState();
}

class _RiverImageLoginState extends State<RiverImageLogin> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LoginCubit>(context).loadRiveFile();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
         children: [
           if (cubit.artboard!=null)
             SizedBox(
               height: 0.25.h,
               width: 300,
               child: Rive(artboard: cubit.artboard!),
             ),
         ],
        );
      },
    );
  }
}
