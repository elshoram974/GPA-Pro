import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/auth/verify_code.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:gpa_pro/view/screens/auth/login_screen.dart';

abstract class LoginRemotely {
  static login() {
    AppInjections.mainScreenImp.changeBody(1);
    AppSnackBar.messageSnack(AppConstLang.done.tr);
    // AppSnackBar.messageSnack("login");

    Navigator.popUntil(Get.context!, (route) => route.isFirst);
    // get subjects
    // save user
  }

  static Future<User?> loginToAccount(String email, String password) async {
    Crud crud = Crud();
    ({Map body, StatusRequest status}) post = await crud.postData(
      AppLinks.login,
      {
        "email": email,
        "password": password,
      },
      wantBack: true,
    );

    if (post.status == StatusRequest.success) {
      User user = User.fromJson(post.body as Map<String, dynamic>);
      if (user.status == 'success') {
        login();
        return user;
      } else {
        Get.back();

        if (user.data.message == 'email not exist') {
          CustomDialog.errorDialog(AppConstLang.emailDoesNotExist.tr);
        } else if (user.data.message == 'Wrong password') {
          CustomDialog.errorDialog(AppConstLang.wrongPassword.tr);
        } else if (user.data.message == 'Your account is not verified') {
          User? temp;
          await CustomDialog.warningDialog(
            AppConstLang.yourAccountIsNotVerified.tr,
            closeBeforeFunction: true,
            textConfirm: AppConstLang.verifyAccount.tr,
            onConfirm: () async {
              CustomDialog.loadDialog(canBack: false);
              temp = await VerifyCode.sendAndVerify(email, const LoginScreen());
            },
          );
          return temp;
        } else {
          AppSnackBar.messageSnack('${user.data.message}');
        }
      }
    } else if (post.status != StatusRequest.offlineFailure) {
      Get.back();

      AppSnackBar.messageSnack('Error : ${post.status}');
    }

    return null;
  }
}
