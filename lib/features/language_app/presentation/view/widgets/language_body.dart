import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/features/language_app/presentation/viewModel/language_app_cubit.dart';
import 'package:gradutionproject/features/language_app/presentation/viewModel/language_app_state.dart';
import '../../../../../core/shared_widget/custom_continer_check.dart';

class LanguageBody extends StatefulWidget {
  const LanguageBody({super.key});

  @override
  State<LanguageBody> createState() => _LanguageBodyState();
}

class _LanguageBodyState extends State<LanguageBody> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<LanguageAppCubit>(context).fetchGetAllLevel();
  }
  @override
  Widget build(BuildContext context) {
    LanguageAppCubit cubit = BlocProvider.of<LanguageAppCubit>(context);
    return BlocBuilder<LanguageAppCubit, LanguageAppState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              CustomContainerCheck(
                isCheck: cubit.isArabic,
                title: AppText.arabicLanguage,
              ),
              const Spacer(),
              CustomContainerCheck(
                isCheck: cubit.isArabic == false,
                title: AppText.englishLanguage,
              ),
              const Spacer(
                flex: 3,
              ),
              CustomElevatedButton(
                  onPress: () {
                    cubit.isArabic = !cubit.isArabic;
                    cubit.changeLanguage(cubit.isArabic);
                  },
                  titleButton: AppText.change),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        );
      },
    );
  }
}
