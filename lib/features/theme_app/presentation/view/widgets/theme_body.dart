import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/theme_app/presentation/viewModel/theme_state.dart';

import '../../../../../core/shared_widget/custom_continer_check.dart';
import '../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../core/utils/app_text.dart';
import '../../viewModel/theme_cubit.dart';

class ThemeBody extends StatelessWidget {
  const ThemeBody({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit cubit = BlocProvider.of<ThemeCubit>(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              CustomContainerCheck(
                isCheck: cubit.isLight,
                title: AppText.lightTheme,
              ),
              const Spacer(),
              CustomContainerCheck(
                isCheck: cubit.isLight == false,
                title: AppText.darkTheme,
              ),
              const Spacer(
                flex: 3,
              ),
              CustomElevatedButton(
                  onPress: () {
                    cubit.toggleTheme();
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
