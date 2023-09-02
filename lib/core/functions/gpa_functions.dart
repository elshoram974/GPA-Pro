import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/model/grades_model.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum GradeType { gpa, degree, grade }

class GPAFunctions {
  static final List<Grade> _grades = AppInjections.initialize.grades;
  // static final List<SubjectModel> _subjects = AppInjections.savedData.subjects;
  static int calculatedLength(
      List<ParentModel> modelList, bool returnClcLength) {
    int calculatedLength = 0;
    int notCalculatedLength = 0;
    for (int i = 0; i < modelList.length; i++) {
      if (modelList[i].isCalculated) {
        calculatedLength++;
      } else {
        notCalculatedLength++;
      }
    }
    return returnClcLength ? calculatedLength : notCalculatedLength;
  }

  static bool isCalculated(List<ParentModel> tileModelList) {
    for (ParentModel e in tileModelList) {
      if (e.isCalculated) {
        return true;
      }
    }
    return false;
  }

  static Future<void> makeCalculated(
      List<SubjectModel> modelList, bool isCalculated) async {
    List<SubjectModel> editSubjects = [];
    for (SubjectModel e in modelList) {
      e.isCalculated = isCalculated;
      editSubjects.add(e);
    }
    await SubjectTableDB.removeAll(modelList);
    await SubjectTableDB.insertAll(editSubjects);
    await AppInjections.homeController.getSubjects();
    
  }

  //cumulative
  static int noHours(List<ParentModel> itemList) {
    int sum = 0;
    for (ParentModel e in itemList) {
      if (!e.isCalculated) continue;
      sum += e.hours;
    }
    return sum;
  }

  static double cumulative(List<ParentModel> itemList, {bool isGpa = true}) {
    double numerator = 0.0;
    int sumHours = noHours(itemList);

    for (ParentModel e in itemList) {
      if (!e.isCalculated) continue;

      numerator += isGpa ? (e.gpa * e.hours) : (e.degree * e.hours);
    }

    return sumHours == 0 ? 0 : numerator / sumHours;
  }

  static double cumulativeMaxDegree(List<ParentModel> itemList) {
    double numerator = 0.0;
    int sumHours = noHours(itemList);

    for (ParentModel e in itemList) {
      if (!e.isCalculated) continue;

      e.maxDegree * e.hours;
    }

    return sumHours == 0 ? 0 : numerator / sumHours;
  }
  //----------------------------------------

//gpa
  static double convertToGpa(double degree) {
    for (Grade e in _grades) {
      if (e.degree <= degree) {
        return e.gpa;
      }
    }

    return 0.0;
  }
  //

  //degree
  static double convertToDegree(double gpa) {
    for (Grade e in _grades) {
      if (e.gpa <= gpa) {
        return e.degree;
      }
    }

    return 0.0;
  }
  //

  //grade
  static String gradeResult(
    String result,
    GradeType resultKind,
    int hours, {
    bool retGpa = true,
  }) {
    if (hours == 0) {
      switch (resultKind) {
        case GradeType.gpa || GradeType.degree:
          return AppConstLang.empty.tr;
        default:
          return "0";
      }
    }

    switch (resultKind) {
      case GradeType.gpa:
        {
          for (Grade e in _grades) {
            if (e.gpa <= (double.tryParse(result) ?? 0)) {
              return e.grade;
            }
          }
          break;
        }
      case GradeType.degree:
        {
          for (Grade e in _grades) {
            if (e.degree <= (double.tryParse(result) ?? 0)) {
              return e.grade;
            }
          }
          break;
        }

      default:
        {
          for (Grade e in _grades) {
            if (e.grade.toLowerCase() == result.toLowerCase()) {
              return retGpa ? e.gpa.toString() : e.degree.toString();
            }
          }
        }
    }

    return "0.0";
  }

  static double gpaResult(String result, GradeType resultKind, int hours) {
    assert(resultKind != GradeType.gpa);
    if (hours == 0) {
      return 0.0;
    }

    switch (resultKind) {
      case GradeType.degree:
        {
          for (Grade e in _grades) {
            if (e.degree <= (double.tryParse(result) ?? 0)) {
              return e.gpa;
            }
          }
          break;
        }
      case GradeType.grade:
      default:
        {
          for (Grade e in _grades) {
            if (e.grade == result) {
              return e.gpa;
            }
          }
          break;
        }
    }

    return 0.0;
  }
  //

  // color of result
  static Color color(
    BuildContext context,
    double gpa,
    int hours,
    bool isCalculated, {
    bool inList = true,
  }) {
    if (hours == 0 || !isCalculated) {
      return context.isDarkMode ? Colors.amber.shade800 : Colors.amber;
    }
    Color? color;
    for (Grade e in _grades) {
      if (gpa >= e.gpa) {
        color = context.isDarkMode ? e.darkColor : e.lightColor;
        if (/*color == Colors.transparent || */ color == null) break;
        return color;
      }
    }
    // return null;

    return inList
        ? (context.isDarkMode ? Colors.blueGrey.shade800 : Colors.white70)
        : context.isDarkMode
            ? Colors.blue.shade700
            : Colors.blue.shade300;
  }

  // static PdfColor? pdfColor(double gpa, int hours, {bool inList = true}) {
  //   List<Grade> myGrades = _myGrade.myGrades;
  //   if (hours == 0) {
  //     return PdfColors.amber;
  //   }
  //   if (gpa >= myGrades[2].gpa) {
  //     return PdfColors.green;
  //   } else if (gpa == myGrades[myGrades.length - 1].gpa) {
  //     return PdfColors.red700;
  //   } else if (gpa < myGrades[myGrades.length - 4].gpa) {
  //     return PdfColors.grey700;
  //   }

  //   return null;
  // }
}
