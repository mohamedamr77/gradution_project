import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_app_bar.dart';
import 'package:gradutionproject/features/notification_feature/presentation/view/widgets/details/notification_details_body.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/locale_keys.g.dart';

class NotificationDetailsScreen extends StatelessWidget {
  static String id = "NotificationDetailsScreen";
  const NotificationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.vaccinationReminder.tr()),
      body: const NotificationDetailsBody(),
    );
  }
}
