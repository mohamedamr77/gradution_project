import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/core/shared_widget/custom_app_bar.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import 'package:gradutionproject/features/my_children/data/repo/my_children_impl.dart';
import 'package:gradutionproject/features/my_children/presentation/view/widgets/my_children_body.dart';
import 'package:gradutionproject/features/my_children/presentation/view_model/my_children_cubit.dart';

class MyChildrenScreen extends StatelessWidget {
  static String id = "my_children_screen";
  const MyChildrenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyChildrenCubit(
        myChildrenRepo: MyChildrenImpl(
          apiService: ApiService(),
        ),
      )..getMyChildren(),
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.myChildren.tr()),
        body: const MyChildrenBody(),
      ),
    );
  }
}
