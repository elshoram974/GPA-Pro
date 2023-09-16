import 'dart:convert';

import 'package:get/get.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/class/subject_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/datasource/remote/auth/login.dart';
import 'package:gpa_pro/data/model/shared/get_shared_subjects_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/data/model/user.dart';

class AddManySubjects {
  const AddManySubjects(this.userId, this.addedSubjects);

  final int userId;
  final List<SubjectModel> addedSubjects;
  Future<List<SubjectModel>?> addNewSubjects() async {
    Crud crud = Crud();
    ({Map body, StatusRequest status}) subjects = await crud.postData(
      AppLinks.addManySubjects,
      {
        'subject_user': "$userId",
        'subjects_SQLCode': _getSubjectsSQLCode(),
      },
      wantBack: true,
    );

    if (subjects.status == StatusRequest.success) {
      SharedSubject addedSubjects =
          SharedSubject.fromJson(subjects.body as Map<String, dynamic>);
      SharedSubjectsData subjectsData = addedSubjects.data;

      if (addedSubjects.status == 'success') {
        return SubjectHelper(subjectsData.subjects)
            .makeAllSubjectsNeedSyncOrNot(false);
      } else if (subjectsData.message ==
          "unknown error, subjects are not added") {
        AppSnackBar.messageSnack(
            AppConstLang.unknownErrorSubjectsAreNotAdded.tr);
      } else if (subjectsData.message == "email not exist") {
        AppSnackBar.messageSnack(AppConstLang.emailDoesNotExist.tr);
      } else {
        AppSnackBar.messageSnack(subjectsData.message.toString());
      }
    } else if (subjects.status == StatusRequest.offlineFailure) {
      Get.back();
    } else {
      Get.back();
      AppSnackBar.messageSnack('Error : ${subjects.status}');
    }
    return null;
  }

  String _getSubjectsSQLCode() {
    String code = '';
    for (SubjectModel e in addedSubjects) {
      String subject =
          "($userId,'${e.nameEn}','${e.nameAr}',${e.myMidDegree},${e.myYearWorkDegree},${e.myPracticalDegree},${e.myFinalDegree},${e.maxMidDegree}, ${e.maxYearWorkDegree},${e.maxPracticalDegree},${e.maxFinalDegree}, ${e.degree},${e.maxDegree},${e.savedGPA},${e.hours},${e.isCalculated},'${e.semester}','${e.year}')";

      code += ", $subject";
    }
    code = code.substring(2);
    return jsonEncode(code);
  }
}

class InsertSubjects {
  Future<void> insert(List<SubjectModel> subjectsList) async {
    Get.back();
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
      } catch (e) {
        addedTemp.clear();
        addedTemp.addAll(temp);
        AppSnackBar.messageSnack(AppConstLang.savedToDeviceOnly.tr);
      }
    }

    await SubjectTableDB.insertAll(addedTemp);
  }
}
