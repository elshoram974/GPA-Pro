import 'package:gpa_pro/core/ads/class/interstitial_ads.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/grades/grade_table_db.dart';
import 'package:gpa_pro/core/class/cell_field_model.dart';
import 'package:gpa_pro/data/model/grades_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class EditGradeController extends GetxController {
  List<Grade> get editGrades;
  void onSavedValid(String? newValue, CellFieldModel cellFieldModel);
  void cancel();
  void save();
  void onChange(String value, CellFieldModel cellFieldModel);
  String? validators(String? value, CellFieldModel cellFieldModel);
  void changeColor(Color? color, int column, bool isDarkColor);
  void addColumn();
  void removeColumn();
  Future<bool> onWillPop();
}

class EditGradeControllerImp extends EditGradeController {
  final List<Grade> _editGrades = [];
  final List<Grade> _savedGrades = [];

  @override
  void onInit() {
    _editGrades.addAll(AppInjections.initialize.grades);

    super.onInit();
  }

  @override
  List<Grade> get editGrades => _editGrades;

  GlobalKey<FormState> gradesKey = GlobalKey<FormState>();

  @override
  void cancel([bool isCancel = true]) async {
    if (!(await _isGradesChanged())) return Get.back();
    await CustomDialog.cancelChanges(
      isCancel: isCancel,
      onConfirm: _onSave,
      onCancel: Get.back,
    );
    await AppInjections.initialize.getGrades();
  }

  void _onSave() async {
    if (gradesKey.currentState!.validate()) {
      _savedGrades.clear();
      _savedGrades.addAll(_editGrades);

      gradesKey.currentState!.save();

      await GradeTableDB.newTable(_savedGrades);
      await AppInjections.initialize.getGrades();

      Get.back();
      AppSnackBar.messageSnack(AppConstLang.successfullyDone.tr);

      InterstitialAdsHelper.showAd();

      update();
    }
  }

  @override
  void save() async {
    if (gradesKey.currentState!.validate()) {
      await CustomDialog.warningBeforeConfirm(AppConstLang.save.tr, _onSave);
    }
  }

  @override
  void onSavedValid(String? newValue, CellFieldModel cellFieldModel) async {
    if (cellFieldModel.cellFieldType == CellFieldType.grade) {
      _savedGrades[cellFieldModel.column].grade = newValue!.trim();
    } else if (cellFieldModel.cellFieldType == CellFieldType.degree) {
      _savedGrades[cellFieldModel.column].degree = double.parse(
        newValue!.trim(),
      );
    } else if (cellFieldModel.cellFieldType == CellFieldType.gpa) {
      _savedGrades[cellFieldModel.column].gpa = double.parse(
        newValue!.trim(),
      );
    }
  }

  @override
  void onChange(String value, CellFieldModel cellFieldModel) {
    int column = cellFieldModel.column;

    if (cellFieldModel.cellFieldType == CellFieldType.gpa) {
      _editGrades[column].gpa =
          double.tryParse(value) ?? _editGrades[column].gpa;
    } else if (cellFieldModel.cellFieldType == CellFieldType.degree) {
      _editGrades[column].degree =
          double.tryParse(value) ?? _editGrades[column].degree;
    } else if (cellFieldModel.cellFieldType == CellFieldType.grade) {
      _editGrades[column].grade = value;
    }
  }

  @override
  String? validators(String? value, CellFieldModel cellFieldModel) {
    if (cellFieldModel.cellFieldType == CellFieldType.grade) {
      return AppValidator.validInput(value, 0, 8, ValidType.grade);
    } else if (cellFieldModel.cellFieldType == CellFieldType.degree) {
      int column = cellFieldModel.column;
      if (column != 0) {
        if ((double.tryParse(value!) ?? 0) > _editGrades[column - 1].degree) {
          return "${AppConstLang.cantBeMoreThan.tr} ${_editGrades[column - 1].degree}";
        }
      }
      return AppValidator.validInput(value, 0, 8, ValidType.degree);
    } else if (cellFieldModel.cellFieldType == CellFieldType.gpa) {
      int column = cellFieldModel.column;
      if (column != 0) {
        if ((double.tryParse(value!) ?? 0) > _editGrades[column - 1].gpa) {
          return "${AppConstLang.cantBeMoreThan.tr} ${_editGrades[column - 1].gpa}";
        }
      }
      return AppValidator.validInput(value, 0, 5, ValidType.gpa);
    }

    return null;
  }

  @override
  void changeColor(Color? color, int column, bool isDarkColor) {
    if (isDarkColor) {
      _editGrades[column].darkColor = color;
    } else {
      _editGrades[column].lightColor = color;
    }
    update();
  }

  @override
  void addColumn() {
    // int length = _editGrades.length;
    // Grade newGrade = Grade.getNewEmpty();
    // if (length != 0) {
    //   newGrade = _editGrades[length - 1];
    // }
    // _editGrades.add(newGrade);

    _editGrades.add(Grade.getNewEmpty());

    update();
  }

  @override
  void removeColumn() {
    if (_editGrades.isNotEmpty) {
      _editGrades.removeLast();
    } else {
      AppSnackBar.messageSnack(AppConstLang.thisTableIsEmpty.tr);
    }
    update();
  }

  // -------------------- onWillPop --------------------------------------------

  Future<bool> _isGradesChanged() async {
    List<Grade> saved = [];
    saved.addAll(await AppInjections.initialize.getGrades());

    if (saved.length != _editGrades.length) return true;

    for (int i = 0; i < saved.length; i++) {
      if (!_editGrades[i].isAllEqual(saved[i])) return true;
    }

    return false;
  }

  @override
  Future<bool> onWillPop() async {
    cancel(false);
    return false;
  }
  // -------------------- end onWillPop ----------------------------------------
}
