import 'package:get/get.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/upload_many_subjects.dart';
import 'package:gpa_pro/data/model/user.dart';

class EditNameRemotely {
  const EditNameRemotely(
      {required this.firstName,
      required this.lastName,
      required this.email,
      this.messageInDialog,});

  final String firstName;
  final String lastName;
  final String email;
  final String? messageInDialog;
  Future<UserData?> change() async {
    Crud crud = const Crud();
    ({Map body, StatusRequest status}) post;
    post = await crud.postData(
      AppLinks.editUserName,
      _convertDataToJson(),
      messageInDialog: messageInDialog,
    );

    if (post.status == StatusRequest.success) {
      User user = User.fromJson(post.body as Map<String, dynamic>);

      UserData userData = user.data;

      if (user.status == 'success') {
        return userData;
      } else if (userData.message == "there is no change to save") {
        AppSnackBar.messageSnack(AppConstLang.noChangeToSave.tr);
      } else if (user.data.message == 'email not exist') {
        AppSnackBar.messageSnack(AppConstLang.emailDoesNotExist.tr);
      } else {
        AppSnackBar.messageSnack(userData.message.toString());
      }
    } else if (post.status == StatusRequest.offlineFailure) {
      Get.back();
    } else {
      Get.back();
      if (Get.isSnackbarOpen) Get.closeAllSnackbars();

      AppSnackBar.messageSnack('Error : unknown error');
    }
    return null;
  }

  Map<String, dynamic> _convertDataToJson() {
    final Map<String, dynamic> m = {};

    m.addAll(_map('first_name', firstName.trim()));
    m.addAll(_map('last_name', lastName.trim()));
    m.addAll(_map('email', email.trim()));

    return m;
  }

  Map<String, String> _map(String key, dynamic value) {
    Map<String, String> map = {};
    if (value != null) map[key] = changeWord("$value");
    return map;
  }
}
