import 'dart:convert';

import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/data/datasource/database/sqflite_helper.dart';
import 'package:gpa_pro/data/datasource/static/grades.dart';
import 'package:gpa_pro/data/model/grades_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class GradeTableDB {
  static SharedPreferences pref = AppInjections.myServices.sharedPreferences;

  static const String id = "id";
  static const String grade = "grade";
  static const String gpa = "gpa";
  static const String degree = "degree";
  static const String lightColor = "lightColor";
  static const String darkColor = "darkColor";

  static const String _grades = "Grades";

  static Future<void> createGradesTable(Database database) async {
    await database.execute("""CREATE TABLE $_grades (
        $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
        $grade TEXT NOT NULL, 
        $gpa REAL NOT NULL,
        $degree REAL NOT NULL,
        $lightColor INTEGER, 
        $darkColor INTEGER
        )
      """);
  }

  static Future<List<Grade>> getGrades() async {
    List<Grade> savedGrades = [];
    List mapList = [];

    if (AppConstant.isDesktop) {
      String? gradesInJson = pref.getString(_grades);

      if (gradesInJson != null) {
        mapList.addAll(jsonDecode(gradesInJson));
      }

      for (Map<String, dynamic> map in mapList) {
        savedGrades.add(Grade.fromJson(map));
      }

      if (savedGrades.isEmpty) {
        bool isFirstTime = pref.getBool(SharedKeys.firstOpen) ?? true;
        if (isFirstTime) {
          savedGrades.addAll(GradesHelper().staticGrades);
          await pref.setString(_grades, jsonEncode(savedGrades));
        }
      }
    } else {
      mapList.addAll(await SQFLiteHelper.getData(_grades));

      for (Map<String, dynamic> map in mapList) {
        savedGrades.add(Grade.fromJson(map));
      }

      if (savedGrades.isEmpty) {
        bool isFirstTime = pref.getBool(SharedKeys.firstOpen) ?? true;
        if (isFirstTime) {
          await insertAll(GradesHelper().staticGrades);
          savedGrades.addAll(GradesHelper().staticGrades);
        }
      }
    }
    return savedGrades;
  }

  static Future<int> insert(Grade grade) async {
    int count = 0;
    if (AppConstant.isDesktop) {
      List<Grade> savedGrades = [];
      savedGrades.addAll(await getGrades());
      savedGrades.add(grade);

      bool isSaved = await pref.setString(_grades, jsonEncode(savedGrades));
      count = isSaved ? 1 : 0;
    } else {
      count = await SQFLiteHelper.insertData(_grades, grade.toMapWithoutId());
    }

    return count;
  }

  static Future<List<int>> insertAll(List<Grade> grades) async {
    List<int> allCount = [];
    for (Grade grade in grades) {
      int count = 0;
      count = await insert(grade);
      allCount.add(count);
    }
    return allCount;
  }

  static Future<int> update(Grade grade) async {
    int count = 0;
    if (AppConstant.isDesktop) {
      List<Grade> savedGrades = [];
      savedGrades.addAll(await getGrades());
      int index = savedGrades.indexOf(grade);
      savedGrades.removeAt(index);
      savedGrades.insert(index, grade);

      bool isSaved = await pref.setString(_grades, jsonEncode(savedGrades));
      count = isSaved ? 1 : 0;
    } else {
      count = await SQFLiteHelper.updateData(grade.id, _grades, grade.toJson());
    }

    return count;
  }

  static Future<int> remove(Grade grade) async {
    int count = 0;
    if (AppConstant.isDesktop) {
      List<Grade> savedGrades = [];
      savedGrades.addAll(await getGrades());

      int index = -1;
      for (int i = 0; i < savedGrades.length; i++) {
        if (savedGrades[i].isEqual(grade)) {
          index = i;
          break;
        }
      }
      if (index == -1) {
        return -1;
      }

      savedGrades.removeAt(index);

      bool isDeleted = await pref.setString(_grades, jsonEncode(savedGrades));
      count = isDeleted ? 1 : 0;
    } else {
      count = await SQFLiteHelper.delete(_grades, grade.id);
    }

    return count;
  }

  static Future<void> reset() async {
    List<Grade> grades = await getGrades();
    for (Grade grade in grades) {
      await remove(grade);
    }
    await pref.remove(SharedKeys.firstOpen);
  }

  static Future<List<int>> removeAll() async {
    if (AppConstant.isDesktop) {
      bool isDeleted = await pref.setString(_grades, jsonEncode([]));
      return isDeleted ? [1] : [0];
    } else {
      List<int> counts = [];

      List<Grade> grades = await getGrades();
      for (Grade grade in grades) {
        counts.add(await remove(grade));
      }
      return counts;
    }
  }

  static Future<List<int>> newTable(List<Grade> newGrades) async {
    if (AppConstant.isDesktop) {
      bool isDeleted = await pref.setString(_grades, jsonEncode(newGrades));
      return isDeleted ? [1] : [0];
    } else {
      List<int> counts = [];

      await removeAll();
      counts = await insertAll(newGrades);
      return counts;
    }
  }

  static Future<int> getLastId() async {
    if (AppConstant.isDesktop) {
      List<Grade> allGrades = await getGrades();
      if (allGrades.isEmpty) {
        return 0;
      }
      return allGrades[allGrades.length - 1].id;
    } else {
      return (await getGrades()).last.id;
    }
  }
}
