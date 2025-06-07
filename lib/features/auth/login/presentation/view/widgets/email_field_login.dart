import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';

import '../../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../viewModel/login_cubit.dart';
import '../../viewModel/login_state.dart';

class EmailFieldLogin extends StatelessWidget {
  const EmailFieldLogin({
    super.key,
  });
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
          title: LocaleKeys.emailAddress.tr(),
          prefix: AppIcons.emailIcon,
          hintText: LocaleKeys.enterEmailAddress.tr(),
          controller: cubit.emailController,
        );
      },
    );
  }
}
