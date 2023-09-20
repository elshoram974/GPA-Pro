import 'package:get/get.dart';
import 'package:gpa_pro/controller/home/home_controller.dart';
import 'package:gpa_pro/controller/home/semester_controller.dart';
import 'package:gpa_pro/controller/home/year_controller.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/class/subjects/insert_subjects.dart';
import 'package:gpa_pro/core/class/subjects/saved_changes.dart';
import 'package:gpa_pro/core/class/subjects/subject_helper.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/datasource/remote/auth/login.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/get_subjects.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/data/model/user.dart';

class Synchronization {
  final HomeControllerImp _homeController = AppInjections.homeController;
  // final SharedPreferences _prefs = AppInjections.myServices.sharedPreferences;
  final UserData? _user = LoginRemotely.savedLogin();

  Future<void> synchronizationSubjects() async {
    if (_user == null) return;
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();

    if (await NetHelper.checkInternet()) {
      await SavedChanges.syncSubjects();
    } else {
      AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
    }

    try {
      await Get.find<SemesterControllerImp>().updateSubjects();
    } catch (e) {
      try {
        await Get.find<YearControllerImp>().updateSemester();
      } catch (e) {
        await _homeController.getSubjects();
      }
    }
    Get.back();
  }

  // Future<void> getSubjectsThatNotInLocal() async {
  //   final List<SubjectModel> databaseSubjects = [];
  //   databaseSubjects.addAll(await GetAllSubjects.getSubjectsFromDatabase(_user!.userId!));

  //   final List<SubjectModel> differenceSubjects = [];

  //   SubjectHelper helper = SubjectHelper(await _homeController.getSubjects());

  //   differenceSubjects.addAll(
  //     helper.getSubjectsFromDataBaseThatNotHere(databaseSubjects),
  //   );

  //   await SubjectTableDB.insertAll(
  //     SubjectHelper(differenceSubjects).makeAllSubjectsNeedSyncOrNot(false),
  //   );
  // }
  Future<void> getAllSubjects() async {
    await SubjectTableDB.clearAll();

    final List<SubjectModel> databaseSubjects = [];
    databaseSubjects
        .addAll(await GetAllSubjects.getSubjectsFromDatabase(_user!.userId!));
    SubjectHelper helper = SubjectHelper(databaseSubjects);

    await SubjectTableDB.insertAll(helper.makeAllSubjectsNeedSyncOrNot(false));
    await AppInjections.homeController.getSubjects();
  }

  Future<void> uploadSubjectsThatNotInDatabase() async {
    SubjectHelper s = SubjectHelper(await _homeController.getSubjects());

    // isNeedSyncList(subjectsListPerTerm);
    s.makeSubjectsThatNullRemoteToNeedSync();
    List<SubjectModel> subjectsNeedsSync = [];

    subjectsNeedsSync.addAll(s.getAllSubjectsNeedSync());
    if (subjectsNeedsSync.isNotEmpty) {
      SubjectTableDB.removeAll(subjectsNeedsSync);

      await InsertSubjectsToDatabase().insert(subjectsNeedsSync);
      Get.back();
      AppInjections.mainScreenImp.changeBody(1);
    }
  }
}
