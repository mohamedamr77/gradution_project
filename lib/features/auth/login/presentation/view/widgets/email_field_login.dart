import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';

import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../../core/utils/app_text.dart';
import '../../viewModel/login_cubit.dart';
import '../../viewModel/login_state.dart';

class EmailFieldLogin extends StatelessWidget {
  const EmailFieldLogin({super.key,});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomTextField(
          onTap: cubit.lookAround,
          onChanged: (value) {
            cubit.moveEyes(value);
          },
          onTapOutside: (e) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          title: AppText.emailAddress,
          prefix: AppIcons.emailIcon,
          hintText: AppText.enterEmailAddress,
        );
      },
    );
  }
}
