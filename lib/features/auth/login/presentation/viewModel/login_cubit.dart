import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/features/bottom_nav_bar/presentation/view/bottom_nav_bar_screen.dart';
import 'package:rive/rive.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  // Controllers and variables
  bool visibilityPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Rive-related properties
  final String riveUrl =
      "assets/river/animated_login_character witout back grround.riv";
  SMITrigger? failTrigger, successTrigger;
  SMIBool? isHandUp, isChecking;
  SMINumber? lookNum;
  StateMachineController? stateMachineController;
  Artboard? artboard;

  /// Toggles password visibility and emits a state change
  void togglePasswordVisibility() {
    visibilityPassword = !visibilityPassword;
    emit(PasswordVisibilityChangedState());
  }

  /// Loads the Rive file and initializes the state machine
  Future<void> loadRiveFile() async {
    try {
      final data = await rootBundle.load(riveUrl);
      await RiveFile.initialize();
      final file = RiveFile.import(data);
      final art = file.mainArtboard;

      stateMachineController = StateMachineController.fromArtboard(
        art,
        "Login Machine", // Ensure this matches your Rive file
      );

      if (stateMachineController != null) {
        art.addController(stateMachineController!);

        // Map inputs
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
        artboard = art;
        emit(RiveFileLoadedState());
      }
    } catch (e) {
      debugPrint("Failed to load Rive file: $e");
      emit(RiveFileLoadErrorState());
    }
  }

  /// Makes the character look around
  void lookAround() {
    isChecking?.change(true);
    isHandUp?.change(false);
    lookNum?.change(20);
    emit(CheckingLoginState());
  }

  /// Moves the character's eyes based on text input
  void moveEyes(String value) {

    lookNum?.change(value.length.toDouble() *10);
    // int cursorPosition = emailController.selection.baseOffset;
    //
    // if (cursorPosition < 0) {
    //   lookNum?.change(0); // Default value if cursor position isn't detected
    //   return;
    // }
    //
    // double mappedValue = (cursorPosition / value.length) * 2.0 - 1.0;
    // lookNum?.change(mappedValue);
  }

  /// Raises the character's hands to cover eyes
  void handsUp() {
    isHandUp?.change(true);
    isChecking?.change(false);
    emit(HandUpState());
  }

  /// Lowers the character's hands
  void handsDown() {
    isHandUp?.change(false);
    isChecking?.change(true);
    emit(HandDownState());
  }

  /// Simulates a login attempt
  void loginClick() {
    isChecking?.change(true);
    isHandUp?.change(false);
    emit(CheckingLoginState());

    if (emailController.text == "email" &&
        passwordController.text == "password") {
      successTrigger?.fire();
      NavigationManager.push(BottomNavBarScreen.id);
      emit(LoginSuccessState());
    } else {
      failTrigger?.fire();
      emit(LoginFailState());
    }
  }
}
