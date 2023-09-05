import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/patterns.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:get/get.dart';

enum ValidType { grade, gpa, name, degree, hour }

enum AuthValidType { name, email, password ,int }

enum SubDegree {
  myPracticalDegree,
  myYearWorkDegree,
  myMidDegree,
  myFinalDegree,
  maxPracticalDegree,
  maxYearWorkDegree,
  maxMidDegree,
  maxFinalDegree,
}

class AppValidator {
  static String? validInputAuth(
    String? value,
    int min,
    int max,
    AuthValidType type,
  ) {
    assert(min <= max);
    if (value == null || value.trim() == "") return AppConstLang.fillField.tr;

    switch (type) {
      case AuthValidType.name:
        if (GetUtils.isNum(value)) return AppConstLang.enterValidName.tr;
        break;
      case AuthValidType.email:
        if (!GetUtils.isEmail(value.trim())) return AppConstLang.enterValidEmail.tr;
      case AuthValidType.int:
        if (!GetUtils.isNumericOnly(value)) {
          return AppConstLang.enterValidInt.tr;
        }

      default:
    }

    if (value.length < min) {
      return "${AppConstLang.cantBeLessThan.tr} $min";
    } else if (value.length > max) {
      return "${AppConstLang.cantBeMoreThan.tr} $max";
    }

    return null;
  }

  static String? validInput(
    String? value,
    int min,
    int max,
    ValidType type, {
    double? maxVal,
    bool whenAdd = false,
    bool? wantItArabic,
  }) {
    assert(min <= max);
    if (value == null || value.trim() == "") return AppConstLang.fillField.tr;

    switch (type) {
      case ValidType.name:
        if (GetUtils.isNum(value)) return AppConstLang.enterValidName.tr;
        if (wantItArabic == true) {
          if (!AppPatterns.isArabic(value)) {
            return AppConstLang.writeArabicName.tr;
          }
        } else if (wantItArabic == false) {
          if (!AppPatterns.isEnglish(value)) {
            return AppConstLang.writeEnglishName.tr;
          }
        }

      case ValidType.grade:
        if (GetUtils.isNum(value)) return AppConstLang.enterValidGrade.tr;
        if (whenAdd) {
          Set<String> temp = {};
          temp.addAll(AppInjections.initialize.searchGrades(value));
          if (temp.isEmpty) {
            return AppConstLang.enterValidGrade.tr;
          }
        }
      case ValidType.gpa:
        if (!GetUtils.isNum(value)) return AppConstLang.enterValidGPA.tr;
        if (double.parse(value) < 0) return AppConstLang.enterPositiveNum.tr;
        if (whenAdd) {
          if (double.parse(value) > AppInjections.initialize.grades[0].gpa) {
            return AppConstLang.enterValidGrade.tr;
          }
        }

      case ValidType.degree:
        if (!GetUtils.isNum(value)) return AppConstLang.enterValidDegree.tr;
        if (double.parse(value) < 0) return AppConstLang.enterPositiveNum.tr;

      case ValidType.hour:
        if (!GetUtils.isNumericOnly(value)) {
          return AppConstLang.enterValidHours.tr;
        }
        if (double.parse(value) < 0) return AppConstLang.enterPositiveNum.tr;

      default:
    }

    if (value.length < min) {
      return "${AppConstLang.cantBeLessThan.tr} $min";
    } else if (value.length > max) {
      return "${AppConstLang.cantBeMoreThan.tr} $max";
    }
    if (maxVal != null) {
      if (double.tryParse(value) is double) {
        if (double.parse(value) > maxVal) {
          return "${AppConstLang.cantBeMoreThan.tr} $maxVal";
        }
      }
    }

    return null;
  }

  static String? validSubDegrees(
    String? value,
    int min,
    int max, {
    double? maxVal,
  }) {
    assert(min <= max);
    if (value == null) return null;

    if (!GetUtils.isNum(value) && value != "") {
      return AppConstLang.enterValidDegree.tr;
    }
    if ((double.tryParse(value) ?? 0) < 0) {
      return AppConstLang.enterPositiveNum.tr;
    }

    if (value.length < min) {
      return "${AppConstLang.cantBeLessThan.tr} $min";
    } else if (value.length > max) {
      return "${AppConstLang.cantBeMoreThan.tr} $max";
    }
    if (maxVal != null) {
      if (double.tryParse(value) is double) {
        if (double.parse(value) > maxVal) {
          return "${AppConstLang.cantBeMoreThan.tr} $maxVal";
        }
      }
    }

    return null;
  }
}
