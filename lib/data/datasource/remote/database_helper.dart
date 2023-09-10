import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/data/datasource/remote/auth/login.dart';
import 'package:gpa_pro/data/datasource/remote/get_app_info.dart';
import 'package:gpa_pro/data/model/app_info_model.dart';
import 'package:gpa_pro/data/model/user.dart';

class CheckDataBase {
  static Future<void> init() async {
    CustomDialog.loadDialog(canBack: false);
    AppInfoData? appData = await AppInfoRemotely.getInfo();

    UserData? userData = LoginRemotely.savedLogin();
    if (userData != null && appData != null) {
      User? user = await LoginRemotely.loginToAccount(userData.email, userData.password);
      if (user == null) {
        AppInjections.myServices.sharedPreferences.remove(SharedKeys.userData);
      }
    }
    Get.back();
  }
}
