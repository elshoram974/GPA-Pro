import 'package:gpa_pro/controller/initialize/edit_grade_controller.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/grades/grade_table_db.dart';
import 'package:gpa_pro/data/model/grades_model.dart';
import 'package:get/get.dart';

abstract class InitializeController extends GetxController {
  List<Grade> get grades;
  Future<List<Grade>> getGrades();
  void editButton();
  void resetButton();
}

class InitializeControllerImp extends InitializeController {
  final List<Grade> _grades = [];

  @override
  List<Grade> get grades => _grades;

  @override
  void onInit() async {
    await getGrades();
    super.onInit();
  }

  // get grades -------------------------------------
  Set<String> searchGrades(String query) {
    final Set<String> searchedGrades = {};
    for (Grade grade in grades) {
      if (grade.grade.toLowerCase().contains(query.toLowerCase())) {
        searchedGrades.add(grade.grade);
      }
    }
    return searchedGrades;
  }

  @override
  Future<List<Grade>> getGrades() async {
    _grades.clear();
    _grades.addAll(await GradeTableDB.getGrades());
    searchGrades('');
    await AppInjections.homeController.getSubjects();

    update();
    return _grades;
  }

  @override
  void editButton() async {
    Get.lazyPut<EditGradeControllerImp>(() => EditGradeControllerImp());
    Get.toNamed(AppRoute.editGrades);
  }

  @override
  void resetButton() async {
    await CustomDialog.warningBeforeConfirm(
      AppConstLang.reset.tr,
      () async {
        await GradeTableDB.reset();
        await getGrades();
        AppSnackBar.messageSnack(AppConstLang.successfullyDone.tr);
      },
    );
  }
}
