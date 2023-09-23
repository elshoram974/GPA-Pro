import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/class/update_user.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/user/auth/login.dart';
import 'package:gpa_pro/data/model/user.dart';

abstract class ChangeNameController extends GetxController {
  void onSave();

  Future<bool> onWillPop();
}

class ChangeNameControllerImp extends ChangeNameController {
  late UserData user;

  GlobalKey<FormState> key = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';

  @override
  void onInit() {
    user = LoginRemotely.savedLogin()!;
    super.onInit();
  }

  @override
  void onSave() async {
    if (key.currentState!.validate()) {
      UserData? temp = await UpdateUser.editName(
        firstName: firstName,
        lastName: lastName,
        email: user.email,
      );
      if (temp == null) {
        CustomDialog.errorDialog(AppConstLang.changesNotSaved.tr);
      } else {
        Get.back();
      }
    }
  }

  @override
  Future<bool> onWillPop() async {
    if (firstName.isNotEmpty || lastName.isNotEmpty) {
      bool exit = false;

      await CustomDialog.backDialog(
        onConfirm: onSave,
        onCancel: () => {exit = true},
        textConfirm: AppConstLang.saveChanges.tr,
      );

      return exit;
    }
    return true;
  }
}
