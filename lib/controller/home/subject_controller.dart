import 'package:gpa_pro/controller/edit_subject_controller.dart';
import 'package:gpa_pro/controller/home/semester_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/gpa_functions.dart';
import 'package:gpa_pro/core/functions/patterns.dart';
import 'package:gpa_pro/core/functions/rate_app.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SubjectController extends EditSubjectControllerImp {
  void onChangeCalculated(bool? newVal);

  void changeNoteDir();
  void getArguments(PageArgument argument);
  @override
  void initControllers();
  @override
  void disposeControllers();
  void initialValue();

  double getTotalGpa();
  double getPercentageDegree();
  void updateText();

  Future<bool> onWillPop();
}

class SubjectControllerImp extends SubjectController {
  BuildContext context =
      AppInjections.mainScreenImp.homeNavigatorKey.currentContext!;

  late PageArgument argument;
  SubjectModel thisSubject = SubjectModel.getNewEmpty();
  SubjectModel editedSubject = SubjectModel.getNewEmpty();
  late GPAFunctionsHelper gpaHelper;
  bool _getData = false;

  TextDirection? noteDir;

  late TextEditingController noteController;

  @override
  void onChangeCalculated(bool? newVal) {
    editedSubject.isCalculated = newVal!;
    update();
  }

  @override
  void changeNoteDir() {
    for (String char in noteController.text.characters) {
      if (!AppPatterns.containsSymbolOrNumber(char) && char != " ") {
        if (AppPatterns.isArabic(char)) {
          noteDir = TextDirection.rtl;
        } else {
          noteDir = TextDirection.ltr;
        }
        break;
      }
    }
    update();
  }

  //  init ------------------------------------------
  @override
  void getArguments(PageArgument argument) {
    this.argument = argument;
    SubjectModel subject = argument.model as SubjectModel;

    if (!_getData) {
      thisSubject = subject;
      initialValue();
      _getData = true;
    }
  }

  @override
  void initControllers() {
    noteController = TextEditingController();
    super.initControllers();
  }

  @override
  void disposeControllers() {
    noteController.dispose();

    super.disposeControllers();
  }

  @override
  void initialValue() {
    editedSubject = thisSubject;
    gpaHelper = GPAFunctionsHelper([editedSubject]);

    noteController.text = editedSubject.note ?? "";

    fillControllersBySubject(thisSubject);

    changeNoteDir();

    onChanged(degreeController.text, GradeType.degree);
    gpaController.text = "${thisSubject.gpa}";
    thisSubject = editedSubject;
  }
  // end init ------------------------------------------

  // ----------------- total gpa , % ------------------------

  @override
  void onChangedSubMaxDegree() {
    super.onChangedSubMaxDegree();
    updateText();
  }

  @override
  void onChangedSubSubjectDegree() {
    super.onChangedSubSubjectDegree();
    updateText();
  }

  @override
  void onChanged(String? val, GradeType grade) {
    super.onChanged(val, grade);
    updateText();
  }

  @override
  double getTotalGpa() {
    double myGpa = double.tryParse(gpaController.text) ?? 1;
    int myHours = int.tryParse(hoursController.text) ?? 1;
    return (myGpa * myHours).toPrecision(3);
  }

  @override
  double getPercentageDegree() {
    double myMax = double.tryParse(maxDegreeController.text) ?? 1;
    double myDegree = double.tryParse(degreeController.text) ?? 1;
    if (myMax == 0) return 0;

    if (myMax >= myDegree && myMax != 0) edit();

    return (100 * (myDegree / myMax)).toPrecision(3);
  }

  @override
  void updateText() {
    getTotalGpa();
    getPercentageDegree();

    update();
  }
  // -----------------end total gpa , % ------------------------

  // ----------------- save ------------------------

  void updateSavedSubjects() async {
    if (argument.fromPage == PageType.semesterScreen) {
      await Get.find<SemesterControllerImp>().updateSubjects();
    } else {
      await AppInjections.homeController.getSubjects();
    }
  }
  // ----------------- end update saved subjects ------------------------

  // ----------------- save ------------------------

  void edit() {
    double? myMaxFinalDegree = maxFinalDegreeController.text.trim() == ""
        ? null
        : double.tryParse(maxFinalDegreeController.text.trim());
    double? myMaxMidDegree = maxMidDegreeController.text.trim() == ""
        ? null
        : double.tryParse(maxMidDegreeController.text.trim());
    double? myMaxPracticalDegree =
        maxPracticalDegreeController.text.trim() == ""
            ? null
            : double.tryParse(maxPracticalDegreeController.text.trim());
    double? myMaxYearWorkDegree = maxYearWorkDegreeController.text.trim() == ""
        ? null
        : double.tryParse(maxYearWorkDegreeController.text.trim());
    double? myMyFinalDegree = myFinalDegreeController.text.trim() == ""
        ? null
        : double.tryParse(myFinalDegreeController.text.trim());
    double? myMyMidDegreeController = myMidDegreeController.text.trim() == ""
        ? null
        : double.tryParse(myMidDegreeController.text.trim());
    double? myMyPracticalDegree = myPracticalDegreeController.text.trim() == ""
        ? null
        : double.tryParse(myPracticalDegreeController.text.trim());
    double? myMyYearWorkDegree = myYearWorkDegreeController.text.trim() == ""
        ? null
        : double.tryParse(myYearWorkDegreeController.text.trim());
    editedSubject = SubjectModel(
      id: thisSubject.id,
      nameEn: nameEnController.text,
      nameAr: nameArController.text,
      degree:
          double.tryParse(degreeController.text.trim()) ?? thisSubject.degree,
      maxDegree: double.tryParse(maxDegreeController.text.trim()) ??
          thisSubject.maxDegree,
      hours: int.tryParse(hoursController.text.trim()) ?? thisSubject.hours,
      semester: thisSubject.semester,
      year: thisSubject.year,
      isCalculated: editedSubject.isCalculated,
      maxFinalDegree: myMaxFinalDegree,
      maxMidDegree: myMaxMidDegree,
      maxPracticalDegree: myMaxPracticalDegree,
      maxYearWorkDegree: myMaxYearWorkDegree,
      myFinalDegree: myMyFinalDegree,
      myMidDegree: myMyMidDegreeController,
      myPracticalDegree: myMyPracticalDegree,
      myYearWorkDegree: myMyYearWorkDegree,
      note: noteController.text.trim(),
      savedGPA: savedGPA,
    );
  }

  void _save() async {
    edit();
    await SubjectTableDB.update(editedSubject);
    updateSavedSubjects();
    RateApp.rateAppDialog();
  }

  _saveAndBack() {
    if (nameEnController.text.trim().isEmpty) {
      nameEnController.text = nameArController.text;
    }
    if (nameArController.text.trim().isEmpty) {
      nameArController.text = nameEnController.text;
    }
    if (formKey.currentState!.validate()) {
      _save();
      Navigator.pop(context);
    } else {
      CustomDialog.warningDialog(AppConstLang.fillAllFieldCorrectly.tr);
    }
  }

  void onSave() async {
    return await CustomDialog.warningDialog(
      closeBeforeFunction: true,
      AppConstLang.itWillBeSaved.tr,
      onConfirm: _saveAndBack,
    );
  }
  // ----------------- end save ------------------------

  // -------------------- onWillPop --------------------------------------------

  bool _isSubjectChanged() => !editedSubject.isAllEqual(thisSubject);

  @override
  Future<bool> onWillPop() async {
    updateSavedSubjects();
    if (!_isSubjectChanged()) return true;
    bool exit = false;

    await CustomDialog.cancelChanges(
      isCancel: false,
      onConfirm: _saveAndBack,
      onCancel: () => {exit = true},
    );

    return exit;
  }

  // -------------------- end onWillPop ----------------------------------------
}
