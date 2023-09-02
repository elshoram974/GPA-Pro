import 'dart:developer';

import 'package:get/get.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/shared/get_shared_subjects_model.dart';

class SharedSubjects {
  static Future<SharedSubjectsData> _getSubjects(String userSharedId) async {
    Crud crud = Crud();
    ({Map body, StatusRequest status}) subjects =
        await crud.getData('${AppLinks.getShared}?user_sharedId=$userSharedId');

    if (subjects.status == StatusRequest.success) {
      SharedSubject sharedSubject =
          SharedSubject.fromJson(subjects.body as Map<String, dynamic>);
      log(sharedSubject.toString());
      SharedSubjectsData subjectsData = sharedSubject.data;

      if (sharedSubject.status == 'success') {
        return subjectsData;
      } else {
        AppSnackBar.messageSnack('${subjectsData.message?.tr}');
      }
    } else if (subjects.status != StatusRequest.offlineFailure) {
      AppSnackBar.messageSnack('Error : ${subjects.status}');
    }
    throw "Error: ${subjects.status}";
  }

  static Future<void> getSubjects(String link) async {
    // https://gpapro.mrecode.com/?user_sharedId=8588913772

    Uri uri = Uri.parse(link);
    String? sharedId = uri.queryParameters['user_sharedId'];

    if (sharedId != null) {
      AppSnackBar.messageSnack(sharedId);
      SharedSubjectsData subjectsData = await _getSubjects(sharedId);

      Get.toNamed(
        AppRoute.uploadScreen,
        arguments: UploadArguments(
          title: AppConstLang.sharedSubjects.tr,
          newSubjects: subjectsData.subjects,
        ),
      );
    } else {
      Get.back();
      AppSnackBar.messageSnack(AppConstLang.errorInLink.tr);
    }
  }
}
