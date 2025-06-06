import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/toast_utils.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/token_manager.dart';
import 'package:gradutionproject/features/auth/login/data/model/login_request_model.dart';
import 'package:gradutionproject/features/auth/login/data/repo/login_repo.dart';
import 'package:gradutionproject/features/bottom_nav_bar/presentation/view/bottom_nav_bar_screen.dart';
import 'package:rive/rive.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitialState());
  final LoginRepo loginRepo;
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
    lookNum?.change(value.length.toDouble() * 10);

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

  Future<void> loginWithEmail ()async{
    emit(LoginWithEmailLoadingState());
    final result = await loginRepo.userLogin(
      loginRequest: LoginRequest(email: emailController.text, password: passwordController.text)
    );
    result.fold(
      (failure) {
        debugPrint("Login Response Error: ${failure.message}");
        ToastUtils.showToast(
          message: failure.message,
        );
        emit(LoginFailState(error: failure.message));
        failTrigger?.fire();
      },
      (authResponse) {
        debugPrint("Login Response Success: ${authResponse.toString()}");
        NavigationManager.replaceAll(BottomNavBarScreen.id);
        ToastUtils.showToast(
          message: "Login Successful",
          backgroundColor: AppColors.greenColor,
        );
        TokenManager.saveToken(authResponse.token??"");
        emit(LoginWithSuccessState(authResponse: authResponse));
        successTrigger?.fire();

      },
    );
  }

}


/*
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
 */