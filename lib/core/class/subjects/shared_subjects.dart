import 'dart:developer';

import 'package:get/get.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/shared/get_shared_subjects.dart';
import 'package:gpa_pro/data/datasource/remote/shared/share_subjects.dart';
import 'package:gpa_pro/data/datasource/remote/user/auth/login.dart';
import 'package:gpa_pro/data/model/shared/get_shared_subjects_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/datasource/remote/shared/delete_shared_subjects.dart';

class SharedSubjectsHelper {
  final SharedPreferences _pref = AppInjections.myServices.sharedPreferences;

  Future<void> _saveUser(UserData user, String? userSharedId) async {
    await _pref.setString(
      SharedKeys.userData,
      user.copyWith(userSharedId: userSharedId).toRawJson(),
    );
  }

  Future<List<SubjectModel>?> getMyShared({String? messageInDialog}) async {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();

    UserData? userData = LoginRemotely.savedLogin();

    if (userData != null) {
      String? sharedId = userData.userSharedId;
      if (sharedId == null) {
        CustomDialog.warningDialog(AppConstLang.doNotHaveSharedSubjects.tr);
        return null;
      }
      try {
        if (await NetHelper.checkInternet()) {
          final SharedSubjectsData? temp =
              await GetSharedSubjects.getAllSubjects(sharedId);
          if (temp != null) {
            _saveUser(userData, temp.userSharedId);
            return temp.subjects;
          }
        } else {
          AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
        }
      } catch (e) {
        AppSnackBar.messageSnack(e.toString());
      }
    }
    return null;
  }

  Future<List<SubjectModel>?> share(
    List<SubjectModel> subjectsList, {
    String? messageInDialog,
  }) async {
    if (subjectsList.isEmpty) return null;
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();

    UserData? userData = LoginRemotely.savedLogin();

    if (userData != null) {
      int userId = userData.userId!;
      try {
        if (await NetHelper.checkInternet()) {
          ShareSubjectsRemotely share =
              ShareSubjectsRemotely(userId, subjectsList);
          final SharedSubjectsData? temp = await share.call();
          if (temp != null) {
            _saveUser(userData, temp.userSharedId);
            return temp.subjects;
          }
        } else {
          AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
        }
      } catch (e) {
        print(e.toString());
        log(e.toString());
        AppSnackBar.messageSnack(e.toString());
      }
    }
    return null;
  }

  Future<bool> delete(
    List<SubjectModel> subjectsList, {
    String? messageInDialog,
  }) async {
    if (subjectsList.isEmpty) return false;
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();

    UserData? userData = LoginRemotely.savedLogin();

    if (userData != null) {
      int userId = userData.userId!;
      try {
        if (await NetHelper.checkInternet()) {
          DeleteShareSubjectsRemotely delete = DeleteShareSubjectsRemotely(userId, subjectsList);
          final SharedSubjectsData? temp = await delete.call();
          if (temp != null) {
            _saveUser(userData, temp.userSharedId);
            return true;
          }
        } else {
          AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
        }
      } catch (e) {
        AppSnackBar.messageSnack(e.toString());
      }
    }
    return false;
  }
}
