import 'package:get/get.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/class/subjects/saved_changes.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/auth/login.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/update_subject.dart';
import 'package:gpa_pro/data/model/changes_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateSubjectHelper {
  final SharedPreferences pref = AppInjections.myServices.sharedPreferences;

  Future<({SubjectModel? subject, bool hasError})> update(
    SubjectModel subject, {
    bool fromStored = false,
    String? messageInDialog,
  }) async {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();

    UserData? userData = LoginRemotely.savedLogin();

    if (userData != null) {
      int userId = userData.userId!;
      UpdateSubject edit = UpdateSubject(userId, subject, messageInDialog: messageInDialog);
      try {
        if (await NetHelper.checkInternet()) {
          final SubjectModel? temp = await edit.update();
          if (temp != null) return (subject: temp, hasError: false);
        } else {
          if (!fromStored) {
            if (subject.remoteId == null) {
              CustomDialog.errorDialog(AppConstLang.haveToOpenInternetWhenUpdateSubject.tr);
              return (subject: null, hasError: true);
            }

            await SavedChanges.save(
              ChangesInSubjects(
                changeType: ChangeType.updateSubject,
                subjects: [subject],
              ),
            );
          }
          // Get.back();
          // Get.back();

          // CustomDialog.errorDialog(AppConstLang.haveToOpenInternetWhenUpdateSubject.tr);
        }
        // Get.back();
      } catch (e) {
        // Get.back();
        AppSnackBar.messageSnack(AppConstLang.savedToDeviceOnly.tr);
      }
    }
    // Get.back();
    // Get.back();
    return (subject: null, hasError: false);
  }
}
