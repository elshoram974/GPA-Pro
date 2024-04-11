import 'package:gpa_pro/controller/home/add_controller/dialog_controller.dart';
import 'package:gpa_pro/controller/home/semester_controller.dart';
import 'package:gpa_pro/controller/home/year_controller.dart';
import 'package:gpa_pro/controller/select_item.dart/subjects_items.dart';
// import 'package:gpa_pro/core/ads/class/interstitial_ads.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/subjects/insert_subjects.dart';
import 'package:gpa_pro/core/class/subjects/remove_many_subjects.dart';
import 'package:gpa_pro/core/class/subjects/subject_helper.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/rate_app.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/item_card/animated_item_card.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/data/model/year_model.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/add_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddController extends SelectedSubjectController {
  void getArguments(AddArgument argument);
  void getInitSubjectInSemestersAdd();

  List<String> availableYears();
  List<String> availableSemesters();

  void changeSelectedCalc();

  List<SubjectModel> allSubjectsWithoutAdded();
  List<SubjectModel> allSubjects();

  void onYearChanged(String? val);
  void onSemesterChanged(String? val);

  void onSave();
  Future<void> addSubject();

  void removeAddedSubject();

  @override
  Future<bool> onWillPop();
}

class AddControllerImp extends AddController {
  final List<SubjectModel> _deletedSubjects = [];

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  late AddArgument argument;

  SubjectModel? subjectModel;
  int index = 0;
  String? year;
  String? semester;

  @override
  void onReady() {
    getInitSubjectInSemestersAdd();
    super.onReady();
  }

  @override
  void onClose() {
    listKey.currentState?.dispose();
    super.onClose();
  }

  @override
  void getArguments(AddArgument argument) {
    this.argument = argument;
    ParentModel? model = argument.thisModel;
    if (model is YearModel) {
      year = model.name;
    } else if (model is SemesterModel) {
      semester = model.name;
      year = model.year;
    }
  }

  @override
  void getInitSubjectInSemestersAdd() {
    ParentModel? model = argument.thisModel;
    if (model is SemesterModel) {
      listKey.currentState!.insertAllItems(0, model.subjects.length);
      subjectsList.insertAll(0, model.subjects);
      update();
    }
  }

  @override
  List<String> availableYears() {
    List<String> tempYears = [];

    tempYears.addAll(YearModel.years);

    for (YearModel yearsList in AppInjections.homeController.yearsList) {
      tempYears.remove(yearsList.name);
    }

    return tempYears;
  }

  @override
  List<String> availableSemesters() {
    List<String> tempSemesters = [];

    tempSemesters.addAll(SemesterModel.semesters);

    if (argument.thisModel != null) {
      YearModel model = argument.thisModel as YearModel;

      // YearController yearController = Get.find<YearController>();

      for (SemesterModel semesterList in model.semesters) {
        tempSemesters.remove(semesterList.name);
      }
    }

    return tempSemesters;
  }

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
    if (argument.fromPageWithModelType == ModelType.subject) {
      for (SubjectModel e in subjectsList) {
        List<SubjectModel> existed =
            SubjectHelper(storedSubjects).searchByNameAddress(e);
        for (SubjectModel s in existed) {
          storedSubjects.remove(s);
        }
      }
    }
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

  // -------------------- choose year & term -----------------------------------
  void _changeYearTerm(String? yearVal, String? semesterVal) {
    List<SubjectModel> temp = [];
    for (SubjectModel e in subjectsList) {
      temp.add(
        SubjectModel(
          id: e.id,
          nameEn: e.nameEn,
          nameAr: e.nameAr,
          semester: semesterVal!,
          year: yearVal!,
          degree: e.degree,
          hours: e.hours,
          maxDegree: e.maxDegree,
          isCalculated: e.isCalculated,
          maxFinalDegree: e.maxFinalDegree,
          maxMidDegree: e.maxMidDegree,
          maxPracticalDegree: e.maxPracticalDegree,
          maxYearWorkDegree: e.maxYearWorkDegree,
          myFinalDegree: e.myFinalDegree,
          myMidDegree: e.myMidDegree,
          myPracticalDegree: e.myPracticalDegree,
          myYearWorkDegree: e.myYearWorkDegree,
          note: e.note,
          savedGPA: e.savedGPA,
        ),
      );
    }

    subjectsList.clear();
    subjectsList.addAll(temp);
    update();
  }

  @override
  void onYearChanged(String? val) => {
        year = val,
        _changeYearTerm(year, semester),
      };

  @override
  void onSemesterChanged(String? val) => {
        semester = val,
        _changeYearTerm(year, semester),
      };

  // -------------------- end choose year & term -------------------------------

  // -------------------- onTap ------------------------------------------------

  @override
  void onTap(int selectedIndex) async {
    if (!isSelected) {
      subjectModel = subjectsList[selectedIndex];
      index = selectedIndex;
      await addSubject();
      subjectModel = null;
      update();
    }
    super.onTap(selectedIndex);
  }
  // -------------------- end onTap --------------------------------------------
  // ---------------------- add ------------------------------------------------

  @override
  Future<void> addSubject() async {
    if (year == null || semester == null) {
      CustomDialog.errorDialog(
        "${AppConstLang.error.tr} :-  ${AppConstLang.addYear.tr} , ${AppConstLang.semester.tr}",
      );
      return;
    }
    try {
      Get.lazyPut<DialogControllerImp>(() => DialogControllerImp());
      await Get.dialog(const AddedDialog(), barrierDismissible: false);
    } catch (e) {
      CustomDialog.errorDialog("${AppConstLang.error.tr} :- ($e)");
      AppSnackBar.messageSnack("error: $e");
    }
  }

  // -------------------- end added --------------------------------------------

  // ---------------------- save ------------------------------------------------
  void _save() async {
    if (subjectsList.isNotEmpty) {
      if (argument.thisModel == null) {
        await InsertSubjectsToDatabase().insert(subjectsList);

        await AppInjections.homeController.getSubjects();
      } else if (argument.thisModel is YearModel) {
        await InsertSubjectsToDatabase().insert(subjectsList);

        await Get.find<YearControllerImp>().updateSemester();
      } else {
        SemesterModel model = argument.thisModel as SemesterModel;

        await RemoveManySubjects().remove(model.subjects);
        await SubjectTableDB.removeAll(model.subjects);

        await InsertSubjectsToDatabase().insert(subjectsList);

        await Get.find<SemesterControllerImp>().updateSubjects();
      }

      AppSnackBar.messageSnack(AppConstLang.done.tr);
      semester = null;
      year = null;
      Navigator.popUntil(Get.context!, (route) => route.isFirst);
      // InterstitialAdsHelper.showAd();
      RateApp.rateAppDialog();
    }
  }

  @override
  void onSave() async {
    if (subjectsList.isNotEmpty) {
      if (!_isSubjectChanges()) {
        return CustomDialog.warningDialog(
          AppConstLang.subjectsHaveNotBeenChangedToSave.tr,
        );
      }

      await CustomDialog.warningDialog(
        AppConstLang.itWillBeSaved.tr,
        onConfirm: _save,
      );
    } else {
      CustomDialog.warningDialog(AppConstLang.addSubject.tr);
    }
    update();
  }

  // -------------------- end save --------------------------------------------

  // ---------------------- remove added ---------------------------------------

  @override
  void removeAddedSubject() async {
    _deletedSubjects.clear();
    await CustomDialog.warningDialog(
      "${AppConstLang.areUSureUWanna.tr} ${AppConstLang.remove.tr} ${AppConstLang.thatSelected.tr}",
      closeBeforeFunction: true,
      onConfirm: () {
        for (SubjectModel e in selectedList) {
          listKey.currentState!.removeItem(
              subjectsList.indexOf(e),
              (context, animation) => AnimatedItemCard(
                  model: e, isSelected: false, sizeFactor: animation));
          subjectsList.remove(e);
          e.isSelected = false;
          _deletedSubjects.add(e);
        }
        selectAllOrDeselect(false);
        AppSnackBar.snackWhenDelete(
          _deletedSubjects.length,
          () async {
            listKey.currentState!.insertAllItems(0, _deletedSubjects.length);
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

  bool _isSubjectChanges() {
    if (argument.fromPageWithModelType == ModelType.subject) {
      SemesterModel semesterModel = argument.thisModel as SemesterModel;

      return SubjectHelper(subjectsList)
          .isSubjectsChanged(semesterModel.subjects);
    }
    return true;
  }

  @override
  Future<bool> onWillPop() async {
    if (argument.fromPageWithModelType == ModelType.subject) {
      await Get.find<SemesterControllerImp>().updateSubjects();
    }

    if (subjectsList.isNotEmpty) {
      if (!_isSubjectChanges()) return true;

      bool exit = false;

      await CustomDialog.cancelChanges(
        isCancel: false,
        onConfirm: _save,
        onCancel: () => {exit = true},
      );

      return exit;
    }
    return super.onWillPop();
  }

  // -------------------- end onWillPop ----------------------------------------
}
