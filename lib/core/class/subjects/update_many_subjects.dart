import 'dart:convert';

import 'package:get/get.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/auth/login.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/change_calc_subjects.dart';
import 'package:gpa_pro/data/model/change_calc.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateManySubjects {
  final SharedPreferences pref = AppInjections.myServices.sharedPreferences;
  Future<bool> update(
    List<SubjectModel> subjectsList,
    bool makeCalc,
  ) async {
    Get.back();
    CustomDialog.loadDialog(canBack: false);

    UserData? userData = LoginRemotely.savedLogin();

    if (userData != null) {
      int userId = userData.userId!;
      ChangeCalcSubjects edit =
          ChangeCalcSubjects(userId, makeCalc, subjectsList);
      try {
        if (await NetHelper.checkInternet()) {
          final List<SubjectModel>? temp = await edit.changeCalculated();
          if (temp != null) return true;
        } else {
          await _saveWhenNoInterNet(subjectsList, makeCalc);
        }
        Get.back();
      } catch (e) {
        Get.back();
        AppSnackBar.messageSnack(AppConstLang.savedToDeviceOnly.tr);
      }
    } else {
      Get.back();
      return true;
    }
    Get.back();
    Get.back();
    return false;
  }

  Future<List<ChangeCalc>> getSavedChanges() async {
    List<ChangeCalc> saved = [];
    List<dynamic> savedString = [];

    String? getSavedString = pref.getString(SharedKeys.saveChangesSubjects);
    if (getSavedString != null) {
      savedString.addAll(jsonDecode(getSavedString));
    }

    for (Map<String, dynamic> map in savedString) {
      saved.add(ChangeCalc.fromJson(map));
    }
    return saved;
  }

  Future<void> syncChanges() async {
    List<ChangeCalc> list = [];
    list.addAll(await getSavedChanges());
    for (ChangeCalc e in list) {
      final bool updated = await update(e.subjects, e.makeCalculated);
      if (updated) await deleteUpdated(e);
    }
  }

  Future<void> deleteUpdated(ChangeCalc toDelete) async {
    List<ChangeCalc> list = [];
    list.addAll(await getSavedChanges());

    if (list.any((e) => e.id == toDelete.id)) {
      list.removeWhere((e) => e.id == toDelete.id);

      await pref.remove(SharedKeys.saveChangesSubjects);

      for (ChangeCalc e in list) {
        _saveWhenNoInterNet(e.subjects, e.makeCalculated);
      }
    }
  }

  Future<void> _saveWhenNoInterNet(
    List<SubjectModel> subjectsList,
    bool makeCalc,
  ) async {
    List<ChangeCalc> savedChanges = [];
    savedChanges.addAll(await getSavedChanges());

    int changeCalcId = pref.getInt(SharedKeys.saveChangesSubjectsId) ?? 0;
    changeCalcId++;

    savedChanges.add(
      ChangeCalc(
        id: changeCalcId,
        makeCalculated: makeCalc,
        subjects: subjectsList,
      ),
    );

    await pref.setString(
      SharedKeys.saveChangesSubjects,
      jsonEncode(savedChanges),
    );
    await pref.setInt(
      SharedKeys.saveChangesSubjectsId,
      changeCalcId,
    );
  }
}
