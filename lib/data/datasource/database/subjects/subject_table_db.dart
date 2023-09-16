import 'dart:convert';

import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/data/datasource/database/sqflite_helper.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class SubjectTableDB {
  static SharedPreferences pref = AppInjections.myServices.sharedPreferences;

  static const String _subject = "Subject";

  static Future<List<SubjectModel>> getSubjects() async {
    List<SubjectModel> savedSubject = [];
    List mapList = [];

    if (AppConstant.isDesktop) {
      String? subjectInJson = pref.getString(_subject);

      if (subjectInJson != null) {
        mapList.addAll(jsonDecode(subjectInJson));
      }
    } else {
      mapList.addAll(await SQFLiteHelper.getData(_subject));
    }

    for (Map<String, dynamic> map in mapList) {
      savedSubject.add(SubjectModel.fromJson(map));
    }
    return savedSubject;
  }

  static Future<int> insert(SubjectModel subject) async {
    int count = 0;
    if (AppConstant.isDesktop) {
      List<SubjectModel> savedSubject = [];
      savedSubject.addAll(await getSubjects());
      savedSubject.add(subject);

      bool isSaved = await pref.setString(_subject, jsonEncode(savedSubject));
      count = isSaved ? 1 : 0;
    } else {
      count =
          await SQFLiteHelper.insertData(_subject, subject.toMapWithoutId());
    }
    return count;
  }

  static Future<List<int>> insertAll(List<SubjectModel> subjects) async {
    List<int> allCount = [];
    for (SubjectModel subject in subjects) {
      int count = 0;
      count = await insert(subject);
      allCount.add(count);
    }
    return allCount;
  }

  static Future<int> update(SubjectModel subject) async {
    int count = 0;
    if (AppConstant.isDesktop) {
      List<SubjectModel> savedSubject = [];
      savedSubject.addAll(await getSubjects());
      int index = 0;
      for (int i = 0; i < savedSubject.length; i++) {
        if (subject.isEqualByNameAddress(savedSubject[i])) {
          // savedSubject.removeAt(i);
          // savedSubject.insert(i, subject);
          index = i;
          break;
        }
      }
      savedSubject.removeAt(index);
      savedSubject.insert(index, subject);

      bool isSaved = await pref.setString(_subject, jsonEncode(savedSubject));
      count = isSaved ? 1 : 0;
    } else {
      count = await SQFLiteHelper.updateData(
          subject.id, _subject, subject.toJson()); //toMapWithoutId
    }

    return count;
  }

  static Future<int> remove(SubjectModel subject) async {
    int count = 0;
    if (AppConstant.isDesktop) {
      List<SubjectModel> savedSubjects = [];
      savedSubjects.addAll(await getSubjects());
      int index = -1;
      for (int i = 0; i < savedSubjects.length; i++) {
        if (savedSubjects[i].isEqualByNameAddress(subject)) {
          index = i;
          break;
        }
      }
      if (index == -1) {
        return -1;
      }

      savedSubjects.removeAt(index);

      bool isDeleted =
          await pref.setString(_subject, jsonEncode(savedSubjects));
      count = isDeleted ? 1 : 0;
    } else {
      count = await SQFLiteHelper.delete(_subject, subject.id);
    }

    return count;
  }

  static Future<List<int>> removeAll(List<SubjectModel> subjects) async {
    List<int> allCount = [];
    for (SubjectModel subject in subjects) {
      int count = 0;
      count = await remove(subject);
      allCount.add(count);
    }
    return allCount;
  }

  static Future<int> clearAll() async {
    int ret = 0;
    if (AppConstant.isDesktop) {
      bool isCleared = await pref.remove(_subject);
      ret = isCleared ? 1 : 0;
    } else {
      ret = await SQFLiteHelper.clear(_subject);
    }
    await AppInjections.homeController.getSubjects();

    return ret;
  }

  static Future<int> getLastId() async {
    if (AppConstant.isDesktop) {
      List<SubjectModel> allSubjects = await getSubjects();
      if (allSubjects.isEmpty) {
        return 0;
      }
      return allSubjects[allSubjects.length - 1].id;
    } else {
      return (await getSubjects()).last.id;
    }
  }

  static const String id = "id";
  static const String remoteId = "remote_id";
  static const String hours = "hours";
  // static const String gpa = "gpa";
  // static const String totalGPA = "totalGPA";
  // static const String address = "address";
  // static const String isSelected = "isSelected";
  // static const String percentageDegree = "percentageDegree";
  static const String degree = "degree";
  static const String gpa = "gpa";
  static const String nameEn = "nameEn";
  static const String nameAr = "nameAr";
  static const String isCalculated = "isCalculated";
  static const String isNeedSync = "isNeedSync";
  static const String semester = "semester";
  static const String year = "year";
  static const String note = "note";
  static const String maxDegree = "maxDegree";
  static const String myMidDegree = "myMidDegree";
  static const String myYearWorkDegree = "myYearWorkDegree"; // اعمال السنة
  static const String myPracticalDegree = "myPracticalDegree"; // عملي و شفوي
  static const String myFinalDegree = "myFinalDegree";
  static const String maxMidDegree = "maxMidDegree";
  static const String maxYearWorkDegree = "maxYearWorkDegree"; // اعمال السنة
  static const String maxPracticalDegree = "maxPracticalDegree"; // عملي و شفوي
  static const String maxFinalDegree = "maxFinalDegree";

  static Future<void> createSubjectsTable(Database database) async {
    await database.execute("""CREATE TABLE $_subject (
        $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
        $remoteId INTEGER, 
        $nameEn TEXT NOT NULL, 
        $nameAr TEXT,
        $year TEXT NOT NULL, 
        $semester TEXT NOT NULL, 
        $note TEXT, 
        $myMidDegree REAL,
        $myYearWorkDegree REAL,
        $myPracticalDegree REAL,
        $myFinalDegree REAL,
        $maxMidDegree REAL,
        $maxYearWorkDegree REAL,
        $maxPracticalDegree REAL,
        $maxFinalDegree REAL,
        $maxDegree REAL NOT NULL,
        $degree REAL NOT NULL,
        $gpa REAL,
        $hours INTEGER NOT NULL, 
        $isCalculated INTEGER NOT NULL,
        $isNeedSync INTEGER NOT NULL
        )
      """);
  }
}
