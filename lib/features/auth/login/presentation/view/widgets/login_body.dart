import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/widgets/password_field_login.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/widgets/social_auth_login.dart';
import 'package:rive/rive.dart';
import '../../../../../../core/utils/app_text.dart';
import '../../../../../../core/shared_widget/name_screen.dart';
import 'email_field_login.dart';
import 'forget_password_login.dart';
import 'login_button.dart';
import 'not_have_account_login.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool eyeOpen=false;

  final String riveUrl = "assets/river/animated_login_character witout back grround.riv";
  SMITrigger? failTrigger, successTrigger;
  SMIBool? isHandUp, isChecking;
  SMINumber? lookNum;
  StateMachineController? stateMachineController;
  Artboard? artboard;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  Future<void> _loadRiveFile() async {
    try {
      final data = await rootBundle.load(riveUrl);
      final file = RiveFile.import(data);
      final art = file.mainArtboard;
      stateMachineController = StateMachineController.fromArtboard(
        art,
        "Login Machine", // Ensure this matches your Rive file
      );

      if (stateMachineController != null) {
        art.addController(stateMachineController!);
        for (var element in stateMachineController!.inputs) {
          switch (element.name) {
            case "isChecking":
              isChecking = element as SMIBool;
              break;
            case "isHandsUp":
              isHandUp = element as SMIBool;
              break;
            case "trigSuccess":
              successTrigger = element as SMITrigger;
              break;
            case "trigFail":
              failTrigger = element as SMITrigger;
              break;
            case "numLook":
              lookNum = element as SMINumber;
              break;
          }
        }
        setState(() => artboard = art);
      }
    } catch (e) {
      debugPrint("Failed to load Rive file: $e");
    }
  }

  void lookAround() {
    isChecking?.change(true);
    isHandUp?.change(false);
    lookNum?.change(0);
  }
  void moveEyes(String value) {
    // Get the current cursor position in the text field
    int cursorPosition = emailController.selection.baseOffset;

    if (cursorPosition < 0) {
      // Default value if no cursor position is detected
      lookNum?.change(0);
      return;
    }

    // Map the cursor position to a range for lookNum (e.g., -1.0 to 1.0)
    double mappedValue = (cursorPosition / value.length) * 2.0 - 1.0;

    // Update lookNum to move eyes based on cursor position
    lookNum?.change(mappedValue);
  }


  void handsUpOnEyes() {
    isHandUp?.change(true);
    isChecking?.change(false);
  }
  void handsDownOnEyes() {
    isHandUp?.change(false);
    isChecking?.change(true);
  }

  void loginClick() {
    isChecking?.change(true);
    isHandUp?.change(false);

    if (emailController.text == "email" && passwordController.text == "password") {
      successTrigger?.fire();
    } else {
      failTrigger?.fire();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Center(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const NameScreen(
                    title: AppText.login,
                  ),
                 SizedBox(height: 25,),
                  if (artboard!=null)
                    SizedBox(
                      height: 0.25.h,
                      width: double.infinity,
                      child: Rive(artboard: artboard!),
                    ),
                  SizedBox(height: 20,),
                   EmailFieldLogin(
                     onTap: lookAround,
                     onChanged: (value) {
                       moveEyes(value);
                     },
                   ),
                  const SizedBox(
                    height: 16,
                  ),
                   PasswordFieldLogin(
                     onTap: eyeOpen ==false ? handsUpOnEyes :handsDownOnEyes,
                   ),
                  const SizedBox(
                    height: 8,
                  ),
                    ForgetPasswordLogin(),
                  SizedBox(
                    height: 0.05.h,
                  ),
                  const LoginButton(),
                  const SizedBox(
                    height: 16,
                  ),
                  const SocialAuthLogin(),
                  SizedBox(
                    height: 0.04.h,
                  ),
                  const NotHaveAccountLogin(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
