import 'dart:convert';

import 'package:get/get.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/auth/login.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/delete_many_subjects.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoveManySubjects {
  final SharedPreferences pref = AppInjections.myServices.sharedPreferences;
  Future<bool> remove(List<SubjectModel> subjectsList) async {
    if (subjectsList.isEmpty) return false;
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();
    CustomDialog.loadDialog(canBack: true);

    UserData? userData = LoginRemotely.savedLogin();

    if (userData != null) {
      int userId = userData.userId!;
      RemoveSubjects delete = RemoveSubjects(userId, subjectsList);
      try {
        if (await NetHelper.checkInternet()) {
          final bool temp = await delete.remove();
          if (temp) return true;
        } else {
          await _saveWhenNoInterNet(subjectsList);
        }
        Get.back();
      } catch (e) {
        Get.back();
        AppSnackBar.messageSnack(AppConstLang.savedToDeviceOnly.tr);
        return false;
      }
    } else {
      Get.back();
      return true;
    }
    Get.back();
    Get.back();
    return false;
  }

  Future<List<SubjectModel>> getSavedDeleted() async {
    List<SubjectModel> saved = [];
    List<dynamic> savedString = [];

    String? getSavedString = pref.getString(SharedKeys.saveDeletedSubjects);
    if (getSavedString != null) {
      savedString.addAll(jsonDecode(getSavedString));
    }

    for (Map<String, dynamic> map in savedString) {
      saved.add(SubjectModel.fromJson(map));
    }
    return saved;
  }

  Future<void> syncDeleted() async {
    List<SubjectModel> list = [];
    list.addAll(await getSavedDeleted());
    final bool removed = await remove(list);
    if (removed) await deleteDeletedList(list);
  }

  Future<void> deleteDeletedList(List<SubjectModel> toDelete) async {
    List<SubjectModel> list = [];
    list.addAll(await getSavedDeleted());

    for (SubjectModel deleted in toDelete) {
      if (list.any((e) => e.remoteId == deleted.remoteId)) {
        list.removeWhere((e) => e.remoteId == deleted.remoteId);
      }
    }

    await pref.remove(SharedKeys.saveDeletedSubjects);

    _saveWhenNoInterNet(list);
  }

  Future<void> _saveWhenNoInterNet(List<SubjectModel> deletedSubjects) async {
    List<SubjectModel> allDeletedSubjects = [];
    allDeletedSubjects.addAll(await getSavedDeleted());

    allDeletedSubjects.addAll(deletedSubjects);

    await pref.setString(
      SharedKeys.saveDeletedSubjects,
      jsonEncode(allDeletedSubjects),
    );
  }
}
