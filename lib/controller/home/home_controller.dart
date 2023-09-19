import 'package:gpa_pro/controller/home/add_controller/add_controller.dart';
import 'package:gpa_pro/controller/home/year_controller.dart';
import 'package:gpa_pro/controller/select_item.dart/years_items.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/subjects/remove_many_subjects.dart';
import 'package:gpa_pro/core/class/subjects/update_many_subjects.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/functions/sort_by_other_list.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/data/model/year_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeController extends SelectedYearController {
  Future<void> addYear();
  void changeSelectedCalc();
  void remove();
  int? get releaseHours;
  String? validHours(String? value);
  void setRealizedHours(val);
  Future<List<SubjectModel>> getSubjects();
  void onPressedFloatingButton();
}

class HomeControllerImp extends HomeController {
  final List<SubjectModel> _deletedSubjects = [];

  List<SubjectModel> get selectedSubjects {
    List<SubjectModel> selectedSubjects = [];
    for (YearModel e in selectedList) {
      for (SemesterModel s in e.semesters) {
        selectedSubjects.addAll(s.subjects);
      }
    }
    // selectAllOrDeselect(false);
    return selectedSubjects;
  }

  //-----------------add year ----------------------
  @override
  Future<void> addYear() async {
    yearsList = [];

    Set<String> yearsName = {};
    Set<String> termsName = {};

    for (SubjectModel e in subjects) {
      yearsName.add(e.year);
      termsName.add(e.semester);
    }

    Set temp = sortListByOther(YearModel.years, yearsName.toList());
    yearsName = <String>{...temp};

    temp = sortListByOther(SemesterModel.semesters, termsName.toList());
    termsName = <String>{...temp};

    //after sort

    for (String e in yearsName) {
      List<SubjectModel> subjectsListPerYear = [];
      List<SemesterModel> semesterListPerYear = [];

      for (SubjectModel s in subjects) {
        if (s.year == e) subjectsListPerYear.add(s);
      }

      for (int i = 0; i < termsName.length; i++) {
        List<SubjectModel> subjectsListPerTerm = [];

        for (SubjectModel s in subjectsListPerYear) {
          if (s.semester == termsName.toList()[i]) {
            subjectsListPerTerm.add(s);
          }
        }
        if (subjectsListPerTerm.isNotEmpty) {
          semesterListPerYear.add(
            SemesterModel(
              id: semesterListPerYear.length,
              name: termsName.toList()[i],
              subjects: subjectsListPerTerm,
              year: '',
              isNeedSync: isNeedSyncList(subjectsListPerTerm),
            ),
          );
        }
      }
      yearsList.add(
        YearModel(
          id: yearsList.length,
          name: e,
          semesters: semesterListPerYear,
          isNeedSync: isNeedSyncList(semesterListPerYear),
        ),
      );
    }

    update();
  }
  //---------------------------------------------------------------------------

  //--------------------------------onTap---------------------------------------
  @override
  void onTap(int selectedIndex) {
    if (!isSelected) {
      Get.lazyPut<YearControllerImp>(() => YearControllerImp());
      AppInjections.mainScreenImp.homeNavigatorKey.currentState!.pushNamed(
        AppRoute.year,
        arguments: PageArgument(
          model: yearsList[selectedIndex],
          fromPage: PageType.homeScreen,
        ),
      );
    }
    super.onTap(selectedIndex);
  }
  //----------------------------------------------------------------------------

  // ------------------convert calc of selected list --------------------
  void _makeAllCalc(bool makeAllCalc) async {
    List<SubjectModel> temp = [];
    for (YearModel e in selectedList) {
      for (SemesterModel s in e.semesters) {
        for (SubjectModel subject in s.subjects) {
          temp.add(subject..isCalculated = makeAllCalc);
          await SubjectTableDB.update(subject..isCalculated = makeAllCalc);
        }
      }
    }
    selectAllOrDeselect(false);

    await UpdateManySubjects().update(temp, makeAllCalc);

    await getSubjects();
    // Get.back();
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

  //------------------remove---------------------------

  @override
  void remove() async {
    _deletedSubjects.clear();
    await CustomDialog.warningDialog(
      "${AppConstLang.areUSureUWanna.tr} ${AppConstLang.remove.tr} ${AppConstLang.thatSelected.tr}",
      onConfirm: () async {
        for (YearModel e in selectedList) {
          for (SemesterModel s in e.semesters) {
            _deletedSubjects.addAll(s.subjects);
            await SubjectTableDB.removeAll(s.subjects);
          }
          yearsList.remove(e);
        }
        selectAllOrDeselect(false);
        await getSubjects();

        bool canReGet = !AppInjections.myServices.sharedPreferences
            .containsKey(SharedKeys.userData);
        if (canReGet) {
          AppSnackBar.snackWhenDelete(_deletedSubjects.length, () async {
            await SubjectTableDB.insertAll(_deletedSubjects);
            _deletedSubjects.clear();
            await getSubjects();
          });
        } else {
          await RemoveManySubjects().remove(_deletedSubjects);
          AppSnackBar.snackWhenDelete(_deletedSubjects.length, null);
        }

        update();
      },
    );
  }
  //----------------------------------------------------------------------------

  // @override
  // set yearsList(List<YearModel>? newList) {
  //   yearsList.clear();
  //   yearsList.addAll(newList??[]);
  // }

  // @override
  // List<YearModel> get yearsList => yearsList as List<YearModel>;

  // ------------------release hours -----------------

  @override
  int get releaseHours {
    SharedPreferences pref = AppInjections.myServices.sharedPreferences;
    return pref.getInt(SharedKeys.realizedHours) ?? 0;
  }

  @override
  String? validHours(String? value) {
    String? valid = AppValidator.validInput(value, 0, 3, ValidType.hour);
    return valid != null
        ? "$valid\n${AppConstLang.realizedHours.tr} = $releaseHours"
        : null;
  }

  @override
  void setRealizedHours(val) {
    int hours = 0;
    if (validHours(val) == null) {
      hours = int.parse(val.trim());
      SharedPreferences pref = AppInjections.myServices.sharedPreferences;
      pref.setInt(SharedKeys.realizedHours, hours);
    }
  }
  // ------------------end release hours -----------------

  // ------------------get all subjects -----------------
  final List<SubjectModel> subjects = [];

  @override
  Future<List<SubjectModel>> getSubjects() async {
    subjects.clear();
    subjects.addAll(await SubjectTableDB.getSubjects());
    await addYear();
    // searchSubjectByName("");

    // FlutterNativeSplash.remove();
    return subjects;
  }

  @override
  void onPressedFloatingButton() {
    selectAllOrDeselect(false);

    Get.lazyPut<AddControllerImp>(() => AddControllerImp());
    Get.toNamed(
      AppRoute.addScreen,
      arguments: AddArgument(
        title: AppConstLang.addYear.tr,
        fromPageWithModelType: ModelType.year,
      ),
    );
  }
}
