import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/user/auth/login.dart';

abstract class LoginController extends GetxController {
  void changeShowPassword();
  void login();
  Future<bool> onWillPop();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool showPass = true;

  @override
  void changeShowPassword() {
    showPass = !showPass;

    update();
  }

  @override
  void login() async {
    TextInput.finishAutofillContext();
    if (key.currentState!.validate()) {
      await LoginRemotely.loginToAccount(email.trim(), password);
    }
  }

  @override
  Future<bool> onWillPop() async {
    if (email.trim().isNotEmpty || password.trim().isNotEmpty) {
      bool exit = false;

      await CustomDialog.backDialog(
        onConfirm: login,
        onCancel: () => {exit = true},
        textConfirm: AppConstLang.login.tr,
      );

      return exit;
    }
    return true;
  }
}
