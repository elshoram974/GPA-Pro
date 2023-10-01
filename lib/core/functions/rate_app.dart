import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_info.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RateApp {
  static void rateAppDialog() async {
    if (AppConstant.isAndroidOrIOS && await NetHelper.checkInternet()) {
      SharedPreferences prefs = AppInjections.myServices.sharedPreferences;

      int? later = prefs.getInt(SharedKeys.rateLater);
      if (later == -1) return;

      if (later != null) later--;
      prefs.setInt(SharedKeys.rateLater, later ?? 0);

      if (later == 0) {
        prefs.setInt(SharedKeys.rateLater, AppInfo.rateLater);

        Get.defaultDialog(
          buttonColor: AppColor.primary,
          confirmTextColor: Colors.white,
          title: AppConstLang.rateThisApp.tr,
          // middleText: ,
          content: Text(
            AppConstLang.rateMessage.tr,
            textAlign: TextAlign.justify,
          ),

          actions: [
            TextButton(
              onPressed: () {
                prefs.setInt(SharedKeys.rateLater, -1);
                reviewApp();
                Get.back();
              },
              child: Text(AppConstLang.rate.tr),
            ),
            TextButton(
              onPressed: () {
                prefs.setInt(SharedKeys.rateLater, -1);
                Get.back();
              },
              child: Text(AppConstLang.noThanks.tr),
            ),
            TextButton(
              onPressed: Get.back,
              child: Text(AppConstLang.maybeLater.tr),
            ),
          ],
        );
      }
    }
  }

  static void reviewApp() async {
    try {

      if (AppConstant.isAndroid) {
        final InAppReview inAppReview = InAppReview.instance;

        await inAppReview.openStoreListing();
      } else {
        AppSnackBar.messageSnack(AppConstLang.notAvailableNow.tr);
      }
    } catch (e) {
      AppSnackBar.messageSnack(AppConstLang.notAvailableNow.tr);
    }
  }
}
