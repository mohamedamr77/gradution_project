import 'package:flutter/material.dart';

import '../../../../shared_widget_auth/social_auth_section.dart';

class SocialAuthLogin extends StatelessWidget {
  const SocialAuthLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialAuthSection(
        onTapFaceBooK: () {}, onTapGoogle: () {}, onTapApple: () {});
  }
}
