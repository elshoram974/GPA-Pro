import 'package:get/get.dart';
import 'package:gpa_pro/core/class/subjects/saved_changes.dart';
import 'package:gpa_pro/core/class/subjects/subject_helper.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/datasource/remote/auth/login.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/upload_many_subjects.dart';
import 'package:gpa_pro/data/model/changes_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/data/model/user.dart';

class InsertSubjectsToDatabase {
  Future<bool> insert(
    List<SubjectModel> subjectsList, {
    bool fromStored = false,
    String? messageInDialog,
  }) async {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();

    bool isDone = false;

    // for remotely
    UserData? userData = LoginRemotely.savedLogin();
    List<SubjectModel> addedTemp = [];
    List<SubjectModel> temp = [];
    temp.addAll(subjectsList);
    addedTemp.addAll(temp);

    if (userData != null) {
      int userId = userData.userId!;
      AddManySubjects addRemote = AddManySubjects(userId, temp, messageInDialog: messageInDialog);
      try {
        addedTemp.clear();
        addedTemp.addAll((await addRemote.addNewSubjects())!);
        await SubjectTableDB.clearAll();
        isDone = true;
      } catch (e) {
        addedTemp.clear();
        addedTemp.addAll(SubjectHelper(temp).makeAllSubjectsWithNullRemoteId());
        if (!fromStored) {
          await SavedChanges.save(
            ChangesInSubjects(
              changeType: ChangeType.addManySubjects,
              subjects: addedTemp,
            ),
          );
        }
        AppSnackBar.messageSnack(AppConstLang.savedToDeviceOnly.tr);
      }
    }

    await SubjectTableDB.insertAll(addedTemp);
    await AppInjections.homeController.getSubjects();
    return isDone;
  }
}
