import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_app_bar.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/features/notification_feature/presentation/view/widgets/details/notification_details_body.dart';

class NotificationDetailsScreen extends StatelessWidget {
  static String id = "NotificationDetailsScreen";
  const NotificationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: AppText.vaccinationReminder),
       body: NotificationDetailsBody(),
    );
  }
}
