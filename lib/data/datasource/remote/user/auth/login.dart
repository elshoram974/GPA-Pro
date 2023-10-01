import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/datasource/remote/user/auth/verify_code.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/synchronization.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:gpa_pro/view/screens/user/auth/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginRemotely {
  static final SharedPreferences _pref =
      AppInjections.myServices.sharedPreferences;

  // static late  UserData userData;
  static Future<void> login(UserData user, String pass) async {
    if (!_pref.containsKey(SharedKeys.userData)) {
      await Synchronization().synchronizationSubjects();

      await _pref.setString(
        SharedKeys.userData,
        user.copyWith(password: pass).toRawJson(),
      );
      await Synchronization().uploadSubjectsThatNotInDatabase();
    }
    await _pref.setString(
      SharedKeys.userData,
      user.copyWith(password: pass).toRawJson(),
    );
    if (await NetHelper.checkInternet()) {
      CachedNetworkImage.evictFromCache("${AppLinks.image}/${user.userImage}");
      await Synchronization().synchronizationSubjects();
    }

    AppInjections.mainScreenImp.changeBody(1);
    AppSnackBar.messageSnack(AppConstLang.done.tr);

    Navigator.popUntil(Get.context!, (route) => route.isFirst);
  }

  static void logOut() async {
    await CachedNetworkImage.evictFromCache(
        "${AppLinks.image}/${savedLogin()?.userImage}");
    await _pref.remove(SharedKeys.userData);
    await _pref.remove(SharedKeys.realizedHours);
    await _pref.remove(SharedKeys.saveAllChangesInSubjects);
    await SubjectTableDB.clearAll();

    AppInjections.mainScreenImp.changeBody(1);
    AppSnackBar.messageSnack(AppConstLang.done.tr);
    Navigator.popUntil(Get.context!, (route) => route.isFirst);
  }

  static void logOutButton() async {
    CustomDialog.warningBeforeConfirm(
      AppConstLang.areYouSureYouWannaLogOut.tr,
      logOut,
      style: const TextStyle(fontSize: 15),
    );
  }

  static Future<User?> loginToAccount(String email, String password) async {
    Crud crud = const Crud();
    ({Map body, StatusRequest status}) post = await crud.postData(
      AppLinks.login,
      {
        "email": email,
        "password": password,
      },
    );

    if (post.status == StatusRequest.success) {
      User user = User.fromJson(post.body as Map<String, dynamic>);
      if (user.status == 'success') {
        print(user.toRawJson());
        log(user.toRawJson());
        await login(user.data, password);
        return user;
      } else {
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
              temp = await VerifyCode.sendAndVerify(
                  email, password, "Verify email", const LoginScreen());
            },
          );
          return temp;
        } else {
          AppSnackBar.messageSnack('${user.data.message}');
        }
      }
    } else if (post.status != StatusRequest.offlineFailure) {
      Get.back();

      AppSnackBar.messageSnack('Error : unknown error');
    }

    return null;
  }

  static UserData? savedLogin() {
    String? data = AppInjections.myServices.sharedPreferences
        .getString(SharedKeys.userData);
    if (data != null) return UserData.fromRawJson(data);
    return null;
  }
}
