import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstOpen {
  static void editGradesDialog() async {
    SharedPreferences pref = AppInjections.myServices.sharedPreferences;
    if (pref.getBool(SharedKeys.firstOpen) ?? true) {
      await CustomDialog.simple(
        title: AppConstLang.instructions.tr,
        middleText: AppConstLang.rememberEditGradesBeforeStart.tr,
        textConfirm: AppConstLang.edit.tr,
        textCancel: AppConstLang.cancel.tr,
        onConfirm: () => AppInjections.mainScreenImp.changeBody(0),
      );
      await pref.setBool(SharedKeys.firstOpen, false);
    }
  }
}
