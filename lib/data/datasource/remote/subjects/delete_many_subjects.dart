import 'dart:convert';

import 'package:get/get.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/shared/get_shared_subjects_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';

class RemoveSubjects {
  const RemoveSubjects(
    this.userId,
    this.removedSubjects,
    {
      this.messageInDialog,
    }
  );

  final int userId;
  final List<SubjectModel> removedSubjects;
  final String? messageInDialog;
  Future<bool> remove()async {
    Crud crud = Crud();
    ({Map body, StatusRequest status}) subjects = await crud.postData(
      AppLinks.deleteManySubjects,
      {
        'user_id': "$userId",
        'where_code': _whereCode(),
      },
      messageInDialog: messageInDialog,
    );

    if (subjects.status == StatusRequest.success) {
      SharedSubject allSubjects =
          SharedSubject.fromJson(subjects.body as Map<String, dynamic>);
      SharedSubjectsData subjectsData = allSubjects.data;

      if (allSubjects.status == 'success') {
        return true;
      } else if (subjectsData.message == "subjects not exist with this user") {
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
      AppSnackBar.messageSnack('Error : ${subjects.status}');
    }
    return false;
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
