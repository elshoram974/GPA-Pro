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
import 'package:gpa_pro/data/datasource/remote/auth/verify_code.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/synchronization.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:gpa_pro/view/screens/auth/login_screen.dart';

abstract class LoginRemotely {
  // static late  UserData userData;
  static Future<void> login(User user, String pass) async {
    AppInjections.myServices.sharedPreferences.setString(
      SharedKeys.userData,
      user.data.copyWith(password: pass).toRawJson(),
    );

    CustomDialog.loadDialog(canBack: false);
    await Synchronization().synchronizationSubjects();
    // await SubjectTableDB.insertAll(
    //   await GetAllSubjects.getOnlineSubjects(user.data.userId!),
    // );
    // await AppInjections.homeController.getSubjects();

    AppInjections.mainScreenImp.changeBody(1);
    AppSnackBar.messageSnack(AppConstLang.done.tr);

    Navigator.popUntil(Get.context!, (route) => route.isFirst);
  }

  static void logOut() async {
    AppInjections.myServices.sharedPreferences.remove(SharedKeys.userData);
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
        await login(user, password);
        return user;
      } else {
        // Get.back();

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

      AppSnackBar.messageSnack('Error : ${post.status}');
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
