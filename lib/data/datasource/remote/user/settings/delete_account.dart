import 'package:get/get.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/user.dart';

class DeleteAccountRemotely {
  const DeleteAccountRemotely({required this.userId, this.messageInDialog});

  final int userId;
  final String? messageInDialog;
  Future<bool> delete() async {
    Crud crud = Crud();
    ({Map body, StatusRequest status}) post;
    post = await crud.postData(
      AppLinks.deleteUser,
      {"user_id": "$userId"},
      messageInDialog: messageInDialog,
    );

    if (post.status == StatusRequest.success) {
      User user = User.fromJson(post.body as Map<String, dynamic>);

      UserData userData = user.data;

      if (user.status == 'success') {
        return true;
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
    return false;
  }
}
