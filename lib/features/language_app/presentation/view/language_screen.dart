import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/features/home/data/repo/home_repo_impl.dart';
import 'package:gradutionproject/features/language_app/presentation/view/widgets/language_body.dart';
import 'package:gradutionproject/features/language_app/presentation/viewModel/language_app_cubit.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/locale_keys.g.dart';

class LanguageScreen extends StatelessWidget {
  static String id = "language_screen";

  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageAppCubit(
          homeRepo: HomeRepoImplement(apiService: ApiService())),
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.language.tr(),
        ),
        body: const LanguageBody(),
      ),
    );
  }
}
