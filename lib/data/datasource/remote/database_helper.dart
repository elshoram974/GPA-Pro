import 'dart:developer';

import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/data/datasource/remote/auth/login.dart';
import 'package:gpa_pro/data/datasource/remote/get_app_info.dart';
import 'package:gpa_pro/data/model/app_info_model.dart';
import 'package:gpa_pro/data/model/user.dart';

class CheckDataBase {
  static Future<void> init() async {
    CustomDialog.loadDialog(canBack: false);
    AppInfoData? appData = await AppInfoRemotely.getInfo();
    print("object");
    log("appData = ${appData?.toJson()} ---------------------------------");

    UserData? userData = LoginRemotely.savedLogin();
    log("userData = ${userData?.toJson()} ---------------------------------");

    if (userData != null && appData != null) {
      User? user = await LoginRemotely.loginToAccount(userData.email, userData.password);
      log("user = ${user?.toJson()} ---------------------------------");
      if (user == null) {
        LoginRemotely.logOut();
      }
    }
    // Get.back();
  }
}
