import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/auth/signup.dart';
import 'package:gpa_pro/data/model/user.dart';

abstract class SignUpController extends GetxController {
  void changeShowPassword({bool isRePass = false});
  void onSignUp();

  Future<bool> onWillPop();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';

  bool showPass = true;
  bool showRePass = true;

  @override
  void changeShowPassword({bool isRePass = false}) {
    if (isRePass) {
      showRePass = !showRePass;
    } else {
      showPass = !showPass;
    }
    update();
  }

  @override
  void onSignUp() async {
    if (key.currentState!.validate()) {
      await SignUpRemotely.createAccount(
        UserData(
          email: email.trim(),
          firstName: firstName.trim(),
          lastName: lastName.trim(),
          password: password,
        ),
      );
    }
  }

  @override
  Future<bool> onWillPop() async {
    if (firstName.trim().isNotEmpty ||
        lastName.trim().isNotEmpty ||
        email.trim().isNotEmpty ||
        password.trim().isNotEmpty) {
      bool exit = false;

      await CustomDialog.backDialog(
        onConfirm: onSignUp,
        onCancel: () => {exit = true},
        textConfirm: AppConstLang.signUp.tr,
      );

      return exit;
    }
    return true;
  }
}
