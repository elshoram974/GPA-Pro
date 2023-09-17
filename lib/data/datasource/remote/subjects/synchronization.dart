import 'package:get/get.dart';
import 'package:gpa_pro/controller/home/home_controller.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/class/subject_helper.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/datasource/remote/auth/login.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/get_subjects.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/upload_many_subjects.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/data/model/user.dart';

class Synchronization {
  final HomeControllerImp _homeController = AppInjections.homeController;
  // final SharedPreferences _prefs = AppInjections.myServices.sharedPreferences;
  final UserData? _user = LoginRemotely.savedLogin();

  Future<void> synchronizationSubjects() async {
    if (_user == null) return;

    if (await NetHelper.checkInternet()) {
      await _getSubjectsThatNotInLocal();
      await _uploadSubjectsThatNotInDatabase();
    } else {
      AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
    }

    await _homeController.getSubjects();
  }

  Future<void> _getSubjectsThatNotInLocal() async {
    final List<SubjectModel> databaseSubjects = [];
    databaseSubjects
        .addAll(await GetAllSubjects.getSubjectsFromDatabase(_user!.userId!));

    final List<SubjectModel> differenceSubjects = [];

    SubjectHelper helper = SubjectHelper(await _homeController.getSubjects());

    differenceSubjects.addAll(
      helper.otherSubjectsThatNotHere(databaseSubjects),
    );

    await SubjectTableDB.insertAll(
      SubjectHelper(differenceSubjects).makeAllSubjectsNeedSyncOrNot(false),
    );
  }

  Future<void> _uploadSubjectsThatNotInDatabase() async {
    SubjectHelper s = SubjectHelper(await _homeController.getSubjects());

    // isNeedSyncList(subjectsListPerTerm);
    List<SubjectModel> subjectsNeedsSync = [];

    subjectsNeedsSync.addAll(s.getAllSubjectsNeedSync());
    if (subjectsNeedsSync.isNotEmpty) {
      SubjectTableDB.removeAll(subjectsNeedsSync);

      await InsertSubjects().insert(subjectsNeedsSync);
      Get.back();
      AppInjections.mainScreenImp.changeBody(1);
    }
  }
}
