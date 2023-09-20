import 'dart:convert';

import 'package:gpa_pro/core/class/subjects/insert_subjects.dart';
import 'package:gpa_pro/core/class/subjects/remove_many_subjects.dart';
import 'package:gpa_pro/core/class/subjects/subject_helper.dart';
import 'package:gpa_pro/core/class/subjects/update_many_subjects.dart';
import 'package:gpa_pro/core/class/subjects/update_subject.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/synchronization.dart';
import 'package:gpa_pro/data/model/changes_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedChanges {
  static final SharedPreferences _prefs =
      AppInjections.myServices.sharedPreferences;

  static Future<List<ChangesInSubjects>> _getSaved() async {
    List<ChangesInSubjects> saved = [];
    List<dynamic> savedString = [];

    String? getSavedString =
        _prefs.getString(SharedKeys.saveAllChangesInSubjects);
    if (getSavedString != null) {
      savedString.addAll(jsonDecode(getSavedString));
    }

    for (Map<String, dynamic> map in savedString) {
      saved.add(ChangesInSubjects.fromJson(map));
    }
    return saved;
  }

  static Future<void> _saveAll(List<ChangesInSubjects> saveChanges) async {
    List<ChangesInSubjects> savedChanges = [];
    savedChanges.addAll(await _getSaved());

    savedChanges.addAll(saveChanges);

    await _prefs.setString(
      SharedKeys.saveAllChangesInSubjects,
      jsonEncode(savedChanges),
    );
  }

  static Future<void> save(ChangesInSubjects saveChanges) async {
    await _saveAll([saveChanges]);
  }

  static Future<List<bool>> syncSubjects() async {
    await Synchronization().getAllSubjects();

    List<bool> changesDone = [];

    List<ChangesInSubjects> savedChanges = [];
    savedChanges.addAll(await _getSaved());
    if (savedChanges.isEmpty) {
      return changesDone;
    }

    int i = 0;
    for (ChangesInSubjects e in savedChanges) {
      i++;
      String loadingMessage = "${(100 * i / savedChanges.length).toStringAsFixed(2)} %";
      bool isDone = false;
      switch (e.changeType) {
        case ChangeType.updateSubject:
          isDone = await _updateSubject(e, loadingMessage);
          break;

        case ChangeType.addManySubjects:
          isDone = await InsertSubjectsToDatabase().insert(
            e.subjects,
            fromStored: true,
            messageInDialog: loadingMessage,
          );
          break;

        case ChangeType.changeCalcSubjects:
          isDone = await _changeCalc(e, loadingMessage);
          break;

        case ChangeType.deleteManySubjects:
          isDone = await _deleteSubjects(e, loadingMessage);
          break;

        default:
      }

      changesDone.add(isDone);
      await Synchronization().getAllSubjects();
    }
    await _prefs.remove(SharedKeys.saveAllChangesInSubjects);

    return changesDone;
  }

  static Future<bool> _deleteSubjects(
    ChangesInSubjects e,
    String loadingMessage,
  ) async {
    return await RemoveManySubjects().remove(
      SubjectHelper(e.subjects).getThereRemoteId(),
      fromStored: true,
      messageInDialog: loadingMessage,
    );
  }

  static Future<bool> _changeCalc(
    ChangesInSubjects e,
    String loadingMessage,
  ) async {
    return await UpdateManySubjects().update(
      SubjectHelper(e.changeCalc!.subjects).getThereRemoteId(),
      e.changeCalc!.makeCalculated,
      fromStored: true,
      messageInDialog: loadingMessage,
    );
  }

  static Future<bool> _updateSubject(
    ChangesInSubjects e,
    String loadingMessage,
  ) async {
    ({bool hasError, SubjectModel? subject}) temp =
        await UpdateSubjectHelper().update(
      e.subjects.first,
      fromStored: true,
      messageInDialog: loadingMessage,
    );
    return temp.subject != null;
  }
}
