import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/auth/verify_code.dart';
import 'package:gpa_pro/data/model/user.dart';

abstract class CheckCodeController extends GetxController {
  void onConfirm();

  Future<bool> onWillPop();
}

class CheckCodeControllerImp extends CheckCodeController {
  GlobalKey<FormFieldState> key = GlobalKey<FormFieldState>();

  String? code = '';
  String email = '';

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void onConfirm() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      CustomDialog.loadDialog(canBack: false);
      User? user = await VerifyCode.checkVerify(email, code);
      if (user != null) {
        AppInjections.mainScreenImp.changeBody(1);
        AppSnackBar.messageSnack(AppConstLang.done.tr);
        Navigator.popUntil(Get.context!, (route) => route.isFirst);
        // save
      }
    }
  }

  @override
  Future<bool> onWillPop() async {
    return false;
  }
}
