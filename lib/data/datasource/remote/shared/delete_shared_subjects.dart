import 'dart:convert';

import 'package:get/get.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/shared/get_shared_subjects_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';

class DeleteShareSubjectsRemotely extends Crud {
  const DeleteShareSubjectsRemotely(
    this.userId,
    this.removedSubjects, {
    this.messageInDialog,
  });

  final int userId;
  final List<SubjectModel> removedSubjects;
  final String? messageInDialog;
  Future<SharedSubjectsData?> call() async {
    ({Map body, StatusRequest status}) subjects = await postData(
      AppLinks.deleteSharedSubjects,
      {
        'user_id': "$userId",
        'where': _whereCode(),
      },
      messageInDialog: messageInDialog,
    );

    if (subjects.status == StatusRequest.success) {
      SharedSubject allSubjects =
          SharedSubject.fromJson(subjects.body as Map<String, dynamic>);
      SharedSubjectsData subjectsData = allSubjects.data;

      if (allSubjects.status == 'success') {
        return subjectsData;
      } else if (subjectsData.message == "no subject found") {
        AppSnackBar.messageSnack(AppConstLang.subjectsNotExistWithUser.tr);
      } else if (subjectsData.message ==
          "subjects are not deleted, may it is already deleted") {
        AppSnackBar.messageSnack(
            AppConstLang.subjectsAreNotDeletedMayDeleted.tr);
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

  String _whereCode() {
    String code = '';
    for (SubjectModel e in removedSubjects) {
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
