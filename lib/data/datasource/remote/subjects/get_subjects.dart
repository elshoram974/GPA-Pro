import 'package:get/get.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/shared/get_shared_subjects_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';

class GetAllSubjects {
  static Future<List<SubjectModel>?> _viewSubjects(int userId) async {
    Crud crud = const Crud();
    ({Map body, StatusRequest status}) subjects =
        await crud.postData(AppLinks.viewSubjects, {'user_id': '$userId'});
    if (subjects.status == StatusRequest.success) {
      SharedSubject viewSubjects =
          SharedSubject.fromJson(subjects.body as Map<String, dynamic>);
      SharedSubjectsData subjectsData = viewSubjects.data;

      if (viewSubjects.status == 'success') {
        return subjectsData.subjects;
      } else if (subjectsData.message == "user does not have subjects") {
        // Get.back();
        AppSnackBar.messageSnack(AppConstLang.userDoesNotHaveSubjects.tr);
      } else if (subjectsData.message == "email not exist") {
        // Get.back();
        AppSnackBar.messageSnack(AppConstLang.emailDoesNotExist.tr);
      } else {
        // Get.back();
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

  static Future<List<SubjectModel>> getSubjectsFromDatabase(int userId) async {
    return await _viewSubjects(userId) ?? [];
  }
}
