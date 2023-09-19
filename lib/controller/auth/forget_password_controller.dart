import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/data/datasource/remote/auth/verify_code.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:gpa_pro/view/screens/auth/forgot_pass_screen.dart';

abstract class ForgotPasswordController extends GetxController {
  void onConfirm();

  Future<bool> onWillPop();
}

class ForgotPasswordControllerImp extends ForgotPasswordController {
  GlobalKey<FormFieldState> key = GlobalKey<FormFieldState>();

  String email = '';

  @override
  void onConfirm() async {
    if (key.currentState!.validate()) {
      User? temp =
          await VerifyCode.sendVerifyCode(email.trim(), "Change password");
      if (temp != null) {
        // Get.back();
        Get.offNamed(
          AppRoute.checkCodeScreen,
          arguments: {
            "email": email.trim(),
            'from': const ForgotPassScreen(),
            'title': "Change password",
          },
        );
      }
    }
  }

  @override
  Future<bool> onWillPop() async {
    if (email.trim().isNotEmpty) {
      bool exit = false;

      await CustomDialog.backDialog(onCancel: () => {exit = true});

      return exit;
    }
    return true;
  }
}
