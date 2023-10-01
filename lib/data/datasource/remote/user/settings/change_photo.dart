import 'dart:io';

import 'package:get/get.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/user.dart';

class ChangePhotoRemotely {
  const ChangePhotoRemotely(this.file, this.email, {this.messageInDialog});

  final File? file;
  final String email;
  final String? messageInDialog;
  Future<UserData?> change() async {
    Crud crud = const Crud();
    ({Map body, StatusRequest status}) post;
    Map<String, dynamic> body = {"email": email.trim()};
    if (file == null) {
      post = await crud.postData(
        AppLinks.changePhoto,
        body,
        messageInDialog: messageInDialog,
      );
    } else {
      post = await crud.postDataWithFile(
        AppLinks.changePhoto,
        body,
        file!,
        messageInDialog: messageInDialog,
      );
    }

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
}
