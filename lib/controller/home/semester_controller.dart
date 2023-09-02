import 'package:gpa_pro/controller/home/add_controller/add_controller.dart';
import 'package:gpa_pro/controller/home/home_controller.dart';
import 'package:gpa_pro/controller/home/subject_controller.dart';
import 'package:gpa_pro/controller/home/year_controller.dart';
import 'package:gpa_pro/controller/select_item.dart/subjects_items.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:get/get.dart';

abstract class SemesterController extends SelectedSubjectController {
  void updateSubjects();
  void changeSelectedCalc();
  void remove();
  void onPressedFloatingButton();
}

class SemesterControllerImp extends SemesterController {
  final HomeControllerImp _homeController = AppInjections.homeController;
  final YearControllerImp _yearController = Get.find<YearControllerImp>();

  late SemesterModel thisSemester;

  void getThisSemester(SemesterModel semester) async {
    thisSemester = semester;
    subjectsList.clear();
    subjectsList.addAll(thisSemester.subjects);
  }

  @override
  void onReady() async {
    await updateSubjects();
    super.onReady();
  }

  //-------------------------update Subjects------------------------------------
  @override
  Future<void> updateSubjects() async {
    List<SubjectModel> temp = await _homeController.getSubjects();
    subjectsList.clear();
    thisSemester.subjects.clear();

    for (SubjectModel e in temp) {
      if (e.year == thisSemester.year && e.semester == thisSemester.name) {
        subjectsList.add(e);
      }
    }
    thisSemester.subjects.addAll(subjectsList);

    await _yearController.updateSemester();

    if (subjectsList.isEmpty) {
      AppInjections.mainScreenImp.homeNavigatorKey.currentState!.pop();
    }

    update();
  }
  //-------------------------end update Subjects--------------------------------

  //--------------------------------onTap---------------------------------------
  @override
  void onTap(int selectedIndex) {
    if (!isSelected) {
      Get.lazyPut<SubjectControllerImp>(() => SubjectControllerImp());
      AppInjections.mainScreenImp.homeNavigatorKey.currentState!.pushNamed(
        AppRoute.subject,
        arguments: PageArgument(
          model: subjectsList[selectedIndex],
          fromPage: PageType.semesterScreen,
        ),
      );
    }
    super.onTap(selectedIndex);
  }
  //----------------------------------------------------------------------------

  // ------------------convert calc of selected list --------------------
  void _makeAllCalc(bool makeAllCalc) async {
    for (SubjectModel e in selectedList) {
      await SubjectTableDB.update(e..isCalculated = makeAllCalc);
    }
    updateSubjects();
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

  //------------------remove---------------------------

  @override
  void remove() async {
    final List<SubjectModel> deletedSubjects = [];

    await CustomDialog.warningDialog(
      "${AppConstLang.areUSureUWanna.tr} ${AppConstLang.remove.tr} ${AppConstLang.thatSelected.tr}",
      onConfirm: () async {
        // await updateSubjects();

        deletedSubjects.addAll(selectedList);
        await SubjectTableDB.removeAll(selectedList);

        selectAllOrDeselect(false);
        await updateSubjects();

        AppSnackBar.snackWhenDelete(deletedSubjects.length, () async {
          await SubjectTableDB.insertAll(deletedSubjects);
          deletedSubjects.clear();

          await updateSubjects();
        });

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
        fromPageWithModelType: ModelType.subject,
        thisModel: thisSemester,
      ),
    );
  }
  //----------------------------------------------------------------------------
}
