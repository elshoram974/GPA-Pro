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

class ChangeCalcSubjects {
  const ChangeCalcSubjects(
    this.userId,
    this.makeCalculated,
    this.editedSubjects, {
    this.messageInDialog,
  });

  final int userId;
  final bool makeCalculated;
  final List<SubjectModel> editedSubjects;
  final String? messageInDialog;
  Future<List<SubjectModel>?> changeCalculated() async {
    Crud crud = Crud();
    ({Map body, StatusRequest status}) subjects = await crud.postData(
      AppLinks.changCalcSubjects,
      {
        'user_id': '$userId',
        'where_code': _whereCode(),
        'make_them_calculated': makeCalculated ? '1' : '0',
      },
      messageInDialog: messageInDialog,
    );

    if (subjects.status == StatusRequest.success) {
      SharedSubject allSubjects =
          SharedSubject.fromJson(subjects.body as Map<String, dynamic>);
      SharedSubjectsData subjectsData = allSubjects.data;

      if (allSubjects.status == 'success') {
        return SubjectHelper(subjectsData.subjects).makeAllSubjectsNeedSyncOrNot(false);
      } else if (subjectsData.message == "subjects not exist with this user") {
        AppSnackBar.messageSnack(AppConstLang.subjectsNotExistWithUser.tr);
      } else if (subjectsData.message == "there is no change to update") {
        AppSnackBar.messageSnack(AppConstLang.thereIsNoChangeToUpdate.tr);
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

  String _whereCode() {
    String code = '';
    for (SubjectModel e in editedSubjects) {
      if (e.remoteId == null) continue;
      String remoteId = "${e.remoteId}";

      code += "OR `remote_id`= $remoteId ";
    }
    try {
      code = code.substring(2);
    } catch (e) {
      code = " 0 ";
    }
    if (code.trim().isEmpty) code = " 0 ";

    return jsonEncode(code);
  }
}
