import 'package:flutter/material.dart';
import 'package:gradutionproject/features/account/presentation/view/widgets/account_body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AccountBody(),
    );
  }
}
