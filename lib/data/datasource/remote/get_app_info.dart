import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_info.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/controller/locale_controller.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/app_info_model.dart';
import 'package:get/get.dart';

class AppInfoRemotely {
  static Future<AppInfoData?> getInfo() async {
    Crud crud = Crud();
    ({Map body, StatusRequest status}) getAppInfo =
        await crud.postData(AppLinks.appInfo, {'appId': AppInfo.appId});

    if (getAppInfo.status == StatusRequest.success) {
      AppInfoModel appInfo =
          AppInfoModel.fromJson(getAppInfo.body as Map<String, dynamic>);
      if (appInfo.status == 'success') {
        AppInfoData appData = appInfo.data;
        LocaleControllerImp _ = Get.find<LocaleControllerImp>();
        if (appData.buildVersion! > AppInfo.appBuildVersion) {
          Get.defaultDialog(
            buttonColor: AppColor.primary,
            confirmTextColor: Colors.white,
            title: _.retAr(appData.messageTitleAr!, appData.messageTitleEn!),
            middleText: _.retAr(
                appData.updateDialogMessageAr!, appData.updateDialogMessageEn!),
            onWillPop: () async => !appData.shouldUpdateOnly!,
            textConfirm: AppConstLang.update.tr,
            textCancel:
                !appData.shouldUpdateOnly! ? AppConstLang.notNow.tr : null,
            onConfirm: appData.whenPressUpdate,
          );
        }
        return appData;
      } else {
        // Get.back();

        AppSnackBar.messageSnack('${appInfo.data.message}');
      }
    } else if (getAppInfo.status == StatusRequest.offlineFailure) {
      // Get.back();
      if (AppInjections.myServices.sharedPreferences
          .containsKey(SharedKeys.userData)) {
        CustomDialog.warningDialog(
          AppConstLang.openInternetWhenAccountOpenedToAvoidErrorsOnServer.tr,
        );
      }

      NetHelper.checkInternetStream((ConnectivityResult result) async {
        if (result != ConnectivityResult.none) await getInfo();
      });
      // print(getAppInfo.status);
    } else {
      // Get.back();

      AppSnackBar.messageSnack('Error : ${getAppInfo.status}');
    }
    return null;
  }
}
