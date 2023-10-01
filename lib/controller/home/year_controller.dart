import 'package:gpa_pro/controller/home/add_controller/add_controller.dart';
import 'package:gpa_pro/controller/home/home_controller.dart';
import 'package:gpa_pro/controller/home/semester_controller.dart';
import 'package:gpa_pro/controller/select_item.dart/semesters_items.dart';
import 'package:gpa_pro/core/ads/class/interstitial_ads.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/subjects/remove_many_subjects.dart';
import 'package:gpa_pro/core/class/subjects/update_many_subjects.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/functions/sort_by_other_list.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/data/model/year_model.dart';
import 'package:get/get.dart';

abstract class YearController extends SelectedSemestersController {
  void updateSemester();

  void changeSelectedCalc();

  void remove();
  void onPressedFloatingButton();
}

class YearControllerImp extends YearController {
  final HomeControllerImp homeController = AppInjections.homeController;
  final List<SubjectModel> _deletedSubjects = [];

  late YearModel thisYear;

  List<SubjectModel> get selectedSubjects {
    List<SubjectModel> selectedSubjects = [];
    for (SemesterModel s in selectedList) {
      selectedSubjects.addAll(s.subjects);
    }
    // selectAllOrDeselect(false);

    return selectedSubjects;
  }

  void getSemesters(YearModel year) async {
    thisYear = year;
    semesterList.clear();
    semesterList.addAll(thisYear.semesters);
  }

  @override
  void onReady() async {
    await updateSemester();
    super.onReady();
  }

  //-------------------------update semester------------------------------------
  @override
  Future<void> updateSemester() async {
    Set<String> termsName = {};

    List<SubjectModel> storedSubjects = await homeController.getSubjects();

    for (SubjectModel e in storedSubjects) {
      if (e.year == thisYear.name) termsName.add(e.semester);
    }

    Set temp = sortListByOther(SemesterModel.semesters, termsName.toList());
    termsName = <String>{...temp};

    //after sort

    List<SubjectModel> subjectsListPerYear = [];
    semesterList.clear();
    thisYear.semesters.clear();

    for (SubjectModel s in storedSubjects) {
      if (s.year == thisYear.name) subjectsListPerYear.add(s);
    }

    for (int i = 0; i < termsName.length; i++) {
      List<SubjectModel> subjectsListPerTerm = [];

      for (SubjectModel s in subjectsListPerYear) {
        if (s.semester == termsName.toList()[i]) {
          subjectsListPerTerm.add(s);
        }
      }
      if (subjectsListPerTerm.isNotEmpty) {
        semesterList.add(
          SemesterModel(
            id: semesterList.length,
            name: termsName.toList()[i],
            subjects: subjectsListPerTerm,
            year: thisYear.name,
            isNeedSync: isNeedSyncList(subjectsListPerTerm),
          ),
        );
      }
    }
    thisYear.semesters.addAll(semesterList);

    await homeController.getSubjects();

    if (semesterList.isEmpty) {
      AppInjections.mainScreenImp.homeNavigatorKey.currentState!.pop();
    }

    update();
  }
  //-------------------------update semester------------------------------------

  //--------------------------------onTap---------------------------------------
  @override
  void onTap(int selectedIndex) {
    if (!isSelected) {
      Get.lazyPut<SemesterControllerImp>(() => SemesterControllerImp());
      AppInjections.mainScreenImp.homeNavigatorKey.currentState!.pushNamed(
        AppRoute.semester,
        arguments: PageArgument(
          model: semesterList[selectedIndex],
          fromPage: PageType.yearScreen,
        ),
      );
    }
    super.onTap(selectedIndex);
  }

  //----------------------------------------------------------------------------
  // ------------------convert calc of selected list --------------------
  void _makeAllCalc(bool makeAllCalc) async {
    List<SubjectModel> temp = [];

    for (SemesterModel s in selectedList) {
      for (SubjectModel subject in s.subjects) {
        temp.add(subject..isCalculated = makeAllCalc);
      }
    }
    selectAllOrDeselect(false);

    bool isUpdated = await UpdateManySubjects().update(temp, makeAllCalc);
    for (SubjectModel e in temp) {
      await SubjectTableDB.update(e..isNeedSync = !isUpdated);
    }

    await updateSemester();
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
        await updateSemester();

        for (SemesterModel s in selectedList) {
          _deletedSubjects.addAll(s.subjects);
          await SubjectTableDB.removeAll(s.subjects);
        }

        selectAllOrDeselect(false);
        await updateSemester();
        bool canReGet = !AppInjections.myServices.sharedPreferences
            .containsKey(SharedKeys.userData);

        if (canReGet) {
          AppSnackBar.snackWhenDelete(_deletedSubjects.length, () async {
            await SubjectTableDB.insertAll(_deletedSubjects);
            _deletedSubjects.clear();

            await updateSemester();
          });
        } else {
          await RemoveManySubjects().remove(_deletedSubjects);
          AppSnackBar.snackWhenDelete(_deletedSubjects.length, null);
        }

        update();
      },
    );
  }

  @override
  void onPressedFloatingButton() {
    selectAllOrDeselect(false);

    Get.lazyPut<AddControllerImp>(() => AddControllerImp());
    Get.toNamed(
      AppRoute.addScreen,
      arguments: AddArgument(
        title: AppConstLang.addSemester.tr,
        fromPageWithModelType: ModelType.semester,
        thisModel: thisYear,
      ),
    );
    InterstitialAdsHelper.showAd();
  }
  //----------------------------------------------------------------------------
}
