import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/data/datasource/remote/auth/login.dart';
import 'package:gpa_pro/data/datasource/remote/auth/verify_code.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:gpa_pro/view/screens/auth/forgot_pass_screen.dart';

abstract class CheckCodeController extends GetxController {
  void startTimer();
  void resendCode();
  void onConfirm();

  Future<bool> onWillPop();
}

class CheckCodeControllerImp extends CheckCodeController {
  GlobalKey<FormFieldState> key = GlobalKey<FormFieldState>();
  late int secondsRemaining;
  bool canReSend = true;
  Timer? _timer;

  String? code = '';
  String email = '';
  String? pass;
  String? mailTitle;
  late Widget from;

  @override
  void onInit() {
    startTimer();
    email = Get.arguments["email"];
    pass = Get.arguments["password"];
    mailTitle = Get.arguments["title"];
    from = Get.arguments["from"];
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  @override
  void startTimer() {
    secondsRemaining = 59;
    canReSend = false;
    update();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        secondsRemaining--;
        if (secondsRemaining <= 0) {
          timer.cancel();
          canReSend = true;
        }
        update();
      },
    );
  }

  @override
  void resendCode() async {
    User? user = await VerifyCode.sendVerifyCode(email, mailTitle);
    if (user != null) {
      // Get.back(canPop: await onWillPop()); // when it null it will close the dialog

      startTimer();
    }
  }

  @override
  void onConfirm() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      User? user = await VerifyCode.checkVerify(email, code);
      if (user != null) {
        if (from is ForgotPassScreen) {
          Get.offNamed(AppRoute.changePasswordScreen, arguments: {'user': user});
        } else {
          LoginRemotely.login(user,pass!);
        }
      }
    }
  }

  @override
  Future<bool> onWillPop() async {
    bool exit = false;
    await CustomDialog.backDialog(onCancel: () => {exit = true});
    return exit;
  }
}
