import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/class/update_user.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/user/auth/login.dart';
import 'package:gpa_pro/data/model/user.dart';

abstract class ChangePassController extends GetxController {
  void onSave();

  Future<bool> onWillPop();
}

class ChangePassControllerImp extends ChangePassController {
  late UserData user;

  GlobalKey<FormState> key = GlobalKey<FormState>();
  String password = '';

  void getUser(UserData? userData) => user = userData ?? user;

  @override
  void onSave() async {
    if (key.currentState!.validate()) {
      UserData? temp = await UpdateUser.changePassword(user.email, password);
      if (temp == null) {
        CustomDialog.errorDialog(AppConstLang.changesNotSaved.tr);
      } else {
        await LoginRemotely.login(temp, password);
      }
    }
  }

  @override
  Future<bool> onWillPop() async {
    bool exit = false;

    await CustomDialog.backDialog(
      onConfirm: onSave,
      onCancel: () => {exit = true},
      textConfirm: AppConstLang.saveChanges.tr,
    );

    return exit;
  }
}
