import 'dart:developer';

import 'package:get/get.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/datasource/remote/auth/login.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/upload_many_subjects.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/data/model/user.dart';

class InsertSubjectsToDatabase {
  Future<void> insert(List<SubjectModel> subjectsList) async {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();

    CustomDialog.loadDialog(canBack: false);
    CustomDialog.loadDialog(canBack: false);

    // for remotely
    UserData? userData = LoginRemotely.savedLogin();
    List<SubjectModel> addedTemp = [];
    List<SubjectModel> temp = [];
    temp.addAll(subjectsList);
    addedTemp.addAll(temp);

    if (userData != null) {
      int userId = userData.userId!;
      AddManySubjects addRemote = AddManySubjects(userId, temp);
      try {
        addedTemp.clear();
        addedTemp.addAll((await addRemote.addNewSubjects())!);
        await SubjectTableDB.clearAll();
      } catch (e) {
        addedTemp.clear();
        addedTemp.addAll(temp);
        print(e);
        log(e.toString());
        AppSnackBar.messageSnack(AppConstLang.savedToDeviceOnly.tr);
      }
    }

    await SubjectTableDB.insertAll(addedTemp);
  }
}
