import 'package:gpa_pro/controller/select_item.dart/subjects_items.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/rate_app.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/upload_many_subjects.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class UploadSavedTxtFile extends SelectedSubjectController {
  void getArguments(UploadArguments argument);

  void changeSelectedCalc();

  List<SubjectModel> allSubjectsWithoutAdded();
  List<SubjectModel> allSubjects();

  void onSave();

  void removeUploadedSubject();

  @override
  Future<bool> onWillPop();
}

class UploadSavedTxtFileImp extends UploadSavedTxtFile {
  GlobalKey<FormFieldState> fieldKey = GlobalKey<FormFieldState>();

  late TextEditingController degreeController;

  final List<SubjectModel> _deletedSubjects = [];

  late UploadArguments argument;

  SubjectModel? subjectModel;
  int index = 0;

  @override
  void onInit() {
    super.onInit();
    degreeController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    degreeController.dispose();
  }

  @override
  void getArguments(UploadArguments argument) {
    this.argument = argument;
    subjectsList.clear();
    subjectsList.addAll(argument.newSubjects);
  }

  // ------------------change degree for all subjects --------------------
  void changeSubjectsDegree() {
    if (fieldKey.currentState!.validate()) {
      List<SubjectModel> temp = [];
      for (SubjectModel e in subjectsList) {
        temp.add(
          SubjectModel(
            id: e.id,
            nameEn: e.nameEn,
            nameAr: e.nameAr,
            degree: (double.parse(degreeController.text) * e.maxDegree) / 100,
            maxDegree: e.maxDegree,
            hours: e.hours,
            semester: e.semester,
            year: e.year,
            isCalculated: e.isCalculated,
          ),
        );
      }
      subjectsList.clear();
      subjectsList.addAll(temp);

      update();
    }
  }

  // ------------------end change degree --------------------

  // ------------------convert calc of selected list --------------------
  void _makeAllCalc(bool makeAllCalc) {
    for (SubjectModel e in selectedList) {
      int i = subjectsList.indexWhere((element) => element.isAllEqual(e));
      subjectsList[i].isCalculated = makeAllCalc;
    }
    selectAllOrDeselect(false);
  }

  @override
  void changeSelectedCalc() async {
    await CustomDialog.simple(
      middleText: AppConstLang.makeSelectedItemsCalculatedNot.tr,
      textConfirm: AppConstLang.makeSelectedCalc.tr,
      textCancel: AppConstLang.makeThemNotCalc.tr,
      onConfirm: () => _makeAllCalc(true),
      onCancel: () => _makeAllCalc(false),
    );
  }
  // ------------------------ end convert ------------------------

  // // -------------------------- myCumulative -----------------------------------

  @override
  List<SubjectModel> allSubjectsWithoutAdded() {
    final List<SubjectModel> storedSubjects = [];
    storedSubjects.addAll(AppInjections.homeController.subjects);

    return storedSubjects;
  }

  @override
  List<SubjectModel> allSubjects() {
    final List<SubjectModel> storedSubjects = [];
    storedSubjects.addAll(allSubjectsWithoutAdded());
    storedSubjects.addAll(subjectsList);

    return storedSubjects;
  }

  // // ------------------------- end myCumulative --------------------------------

  // ---------------------- save ------------------------------------------------
  void _save() async {
    if (subjectsList.isNotEmpty) {

      await InsertSubjects().insert(subjectsList);

      await AppInjections.homeController.getSubjects();

      AppSnackBar.messageSnack(AppConstLang.done.tr);

      Navigator.popUntil(Get.context!, (route) => route.isFirst);
      RateApp.rateAppDialog();
    }
  }

  @override
  void onSave() async {
    if (subjectsList.isNotEmpty) {
      await CustomDialog.warningDialog(
        AppConstLang.itWillBeSaved.tr,
        onConfirm: _save,
      );
      update();
    }
  }

  // -------------------- end save --------------------------------------------

  // ---------------------- remove added ---------------------------------------

  @override
  void removeUploadedSubject() async {
    _deletedSubjects.clear();
    await CustomDialog.warningDialog(
      "${AppConstLang.areUSureUWanna.tr} ${AppConstLang.remove.tr} ${AppConstLang.thatSelected.tr}",
      closeBeforeFunction: true,
      onConfirm: () {
        for (SubjectModel e in selectedList) {
          subjectsList.remove(e);
          e.isSelected = false;
          _deletedSubjects.add(e);
        }
        selectAllOrDeselect(false);
        AppSnackBar.snackWhenDelete(
          _deletedSubjects.length,
          () async {
            subjectsList.insertAll(0, _deletedSubjects);
            _deletedSubjects.clear();

            update();
          },
        );
      },
    );
  }

  // -------------------- end remove -------------------------------------------

  // -------------------- onWillPop --------------------------------------------

  @override
  Future<bool> onWillPop() async {
    if (subjectsList.isNotEmpty) {
      // bool exit = false;

      await CustomDialog.cancelChanges(
        isCancel: false,
        onConfirm: _save,
        onCancel: () {
          Navigator.popUntil(Get.context!, (route) => route.isFirst);
        },
      );

      return false;
    }
    Navigator.popUntil(Get.context!, (route) => route.isFirst);
    return super.onWillPop();
  }

  // -------------------- end onWillPop ----------------------------------------
}
