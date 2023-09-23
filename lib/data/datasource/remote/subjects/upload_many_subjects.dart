import 'dart:convert';

import 'package:get/get.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/class/subjects/subject_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/shared/get_shared_subjects_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';

class AddManySubjects {
  const AddManySubjects(this.userId, this.addedSubjects,
      {this.messageInDialog});

  final int userId;
  final List<SubjectModel> addedSubjects;
  final String? messageInDialog;
  Future<List<SubjectModel>?> addNewSubjects() async {
    Crud crud = Crud();
    ({Map body, StatusRequest status}) subjects = await crud.postData(
      AppLinks.addManySubjects,
      {
        'subject_user': "$userId",
        'subjects_SQLCode': _getSubjectsSQLCode(),
      },
      messageInDialog: messageInDialog,
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
      AppSnackBar.messageSnack('Error : unknown');
    }
    return null;
  }

  String _getSubjectsSQLCode() {
    String code = '';
    for (SubjectModel e in addedSubjects) {
      String subject =
          "($userId,'${changeWord(e.nameEn)}','${changeWord(e.nameAr ?? e.nameEn)}',${e.myMidDegree},${e.myYearWorkDegree},${e.myPracticalDegree},${e.myFinalDegree},${e.maxMidDegree}, ${e.maxYearWorkDegree},${e.maxPracticalDegree},${e.maxFinalDegree}, ${e.degree},${e.maxDegree},${e.savedGPA},${e.hours},${e.isCalculated},'${changeWord(e.semester)}','${changeWord(e.year)}')";

      code += ", $subject";
    }
    code = code.substring(2);
    return jsonEncode(code);
  }
}

changeWord(String word) => word
    .replaceAll("'", ".")
    .replaceAll('"', '..')
    .replaceAll('"', '..')
    .replaceAll(r"\", r"\\");
