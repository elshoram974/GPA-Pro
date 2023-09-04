import 'package:get/get.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/user.dart';

abstract class VerifyCode {
  static Future<User?> sendVerifyCode(String email) async {
    Crud crud = Crud();
    ({Map body, StatusRequest status}) post =
        await crud.postData(AppLinks.sendVerify, {"email": email});

    if (post.status == StatusRequest.success) {
      User user = User.fromJson(post.body as Map<String, dynamic>);
      if (user.status == 'success') {
        return user;
      } else {
        if (user.data.message == 'email not exist') {
          Get.back();
          CustomDialog.errorDialog(AppConstLang.emailIsNotExists.tr);
        } else {
          AppSnackBar.messageSnack('${user.data.message}');
        }
      }
    } else if (post.status != StatusRequest.offlineFailure) {
      AppSnackBar.messageSnack('Error : ${post.status}');
    }
    return null;
  }

  static Future<User?> checkVerify(String email, String? verifiedCode) async {
    Crud crud = Crud();
    ({Map body, StatusRequest status}) post = await crud.postData(
        AppLinks.checkVerify,
        {
          "email": email,
          "verified_code": verifiedCode,
        },
        wantBack: true);

    if (post.status == StatusRequest.success) {
      User user = User.fromJson(post.body as Map<String, dynamic>);
      if (user.status == 'success') {
        return user;
      } else {
        if (user.data.message == 'wrong code') {
          Get.back();
          CustomDialog.errorDialog(AppConstLang.codeUEnteredIncorrect.tr);
        } else {
          AppSnackBar.messageSnack('${user.data.message}');
        }
      }
    } else if (post.status != StatusRequest.offlineFailure) {
      AppSnackBar.messageSnack('Error : ${post.status}');
    }
    return null;
  }
}
