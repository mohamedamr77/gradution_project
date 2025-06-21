import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/features/forget_password/data/repo/forget_password_impl.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/forget_pass_body.dart';
import 'package:gradutionproject/features/forget_password/presentation/view_model/change_pass_cubit/change_pass_cubit.dart';

class ForgetPassScreen extends StatelessWidget {
  static const String id = "ForgetPassScreenId";
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgetPassBody(),
    );
  }
}
