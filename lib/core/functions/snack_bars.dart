import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static SnackbarController exitSnackBar() {
    return customSnackBar(message: AppConstLang.pressBackAgainExit.tr);
  }

  static SnackbarController messageSnack(String e, [Duration? duration]) {
    return customSnackBar(message: e, duration: duration);
  }

  static void snackWhenDelete(int i, Future<void> Function()? onPressed) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.showSnackbar(
      GetSnackBar(
        boxShadows: const <BoxShadow>[
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
        message: "${AppConstLang.removed.tr} $i ${AppConstLang.subject.tr}",
        duration: const Duration(seconds: 5),
        margin: const EdgeInsets.symmetric(vertical: 50),
        mainButton: onPressed == null
            ? null
            : TextButton(
                onPressed: () async {
                  await onPressed();
                  await Get.closeCurrentSnackbar();
                },
                child: Text(AppConstLang.undo.tr),
              ),
        borderRadius: 30,
        padding: EdgeInsets.symmetric(horizontal: AppConstant.kDefaultPadding),
        maxWidth: Get.width * 7 / 9,
      ),
    );
  }
}
