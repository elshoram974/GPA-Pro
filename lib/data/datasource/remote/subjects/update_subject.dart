import 'package:get/get.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/class/subjects/subject_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/upload_many_subjects.dart';
import 'package:gpa_pro/data/model/shared/get_shared_subjects_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';

class UpdateSubject {
  const UpdateSubject(
    this.userId,
    this.updatedSubject, {
    this.messageInDialog,
  });

  final int userId;
  final SubjectModel updatedSubject;
  final String? messageInDialog;
  Future<SubjectModel?> update() async {
    Crud crud = const Crud();
    ({Map body, StatusRequest status}) subject = await crud.postData(
      AppLinks.editSubject,
      _convertSubjectToJson(),
      messageInDialog: messageInDialog,
    );

    if (subject.status == StatusRequest.success) {
      SharedSubject allSubjects =
          SharedSubject.fromJson(subject.body as Map<String, dynamic>);
      SharedSubjectsData subjectsData = allSubjects.data;

      if (allSubjects.status == 'success') {
        return SubjectHelper(subjectsData.subjects)
            .makeAllSubjectsNeedSyncOrNot(false)[0];
      } else if (subjectsData.message == "subject not exist") {
        AppSnackBar.messageSnack(AppConstLang.subjectsNotExistWithUser.tr);
      } else if (subjectsData.message == "there is no change to update") {
        AppSnackBar.messageSnack(AppConstLang.thereIsNoChangeToUpdate.tr);
      } else {
        AppSnackBar.messageSnack(subjectsData.message.toString());
      }
    } else if (subject.status == StatusRequest.offlineFailure) {
      Get.back();
    } else {
      Get.back();
      if (Get.isSnackbarOpen) Get.closeAllSnackbars();

      AppSnackBar.messageSnack('Error : unknown');
    }
    return null;
  }

  Map<String, dynamic> _convertSubjectToJson() {
    final Map<String, dynamic> m = {};

    m.addAll(_map('subject_nameEn', updatedSubject.nameEn));
    m.addAll(
        _map('subject_nameAr', updatedSubject.nameAr ?? updatedSubject.nameEn));
    m.addAll(_map('subject_note', updatedSubject.note));
    m.addAll(_map('subject_myMidDegree', updatedSubject.myMidDegree));
    m.addAll(_map('subject_myYearWorkDegree', updatedSubject.myYearWorkDegree));
    m.addAll(
        _map('subject_myPracticalDegree', updatedSubject.myPracticalDegree));
    m.addAll(_map('subject_myFinalDegree', updatedSubject.myFinalDegree));
    m.addAll(_map('subject_maxMidDegree', updatedSubject.maxMidDegree));
    m.addAll(
        _map('subject_maxYearWorkDegree', updatedSubject.maxYearWorkDegree));
    m.addAll(
        _map('subject_maxPracticalDegree', updatedSubject.maxPracticalDegree));
    m.addAll(_map('subject_maxFinalDegree', updatedSubject.maxFinalDegree));
    m.addAll(_map('subject_degree', updatedSubject.degree));
    m.addAll(_map('subject_maxDegree', updatedSubject.maxDegree));
    m.addAll(_map('subject_gpa', updatedSubject.savedGPA));
    m.addAll(_map('subject_hours', updatedSubject.hours));
    m.addAll(
        _map('subject_isCalculated', updatedSubject.isCalculated ? "1" : "0"));
    m.addAll(_map('subject_semester', updatedSubject.semester));
    m.addAll(_map('subject_year', updatedSubject.year));
    m.addAll(_map('subject_id', updatedSubject.remoteId!));
    return m;
  }

  Map<String, String> _map(String key, dynamic value) {
    Map<String, String> map = {};
    if (value != null) map[key] = changeWord("$value");
    return map;
  }

}
