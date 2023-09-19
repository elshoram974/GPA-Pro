import 'package:gpa_pro/data/datasource/remote/auth/login.dart';
import 'package:gpa_pro/data/datasource/remote/get_app_info.dart';
import 'package:gpa_pro/data/model/app_info_model.dart';
import 'package:gpa_pro/data/model/user.dart';

class CheckDataBase {
  static Future<void> init() async {
    AppInfoData? appData = await AppInfoRemotely.getInfo();

    UserData? userData = LoginRemotely.savedLogin();

    if (userData != null && appData != null) {
      User? user = await LoginRemotely.loginToAccount(userData.email, userData.password);
      if (user == null) {
        LoginRemotely.logOut();
      }
    }
    // Get.back();
  }
}
