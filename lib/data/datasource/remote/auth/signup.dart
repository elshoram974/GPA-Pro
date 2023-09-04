import 'package:get/get.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/auth/verify_code.dart';
import 'package:gpa_pro/data/model/user.dart';

abstract class SignUpRemotely {
  static Future<User?> createAccount(UserData newUser) async {
    Crud crud = Crud();
    ({Map body, StatusRequest status}) post = await crud.postData(
      AppLinks.signup,
      {
        "first_name": newUser.firstName,
        "last_name": newUser.lastName,
        "email": newUser.email,
        "password": newUser.password,
      },
      wantBack: true,
    );

    if (post.status == StatusRequest.success) {
      User user = User.fromJson(post.body as Map<String, dynamic>);
      if (user.status == 'success') {
        User? temp = await VerifyCode.sendVerifyCode(user.data.email);
        if (temp != null) {
          Get.back();
          Get.offNamed(
            AppRoute.checkCodeScreen,
            arguments: {"email": user.data.email},
          );
          return user;
        }
      } else {
        Get.back();

        if (user.data.message == 'email already exist') {
          CustomDialog.errorDialog(AppConstLang.emailAlreadyExists.tr);
        } else {
          AppSnackBar.messageSnack('${user.data.message}');
        }
      }
    } else if (post.status != StatusRequest.offlineFailure) {
      Get.back();

      AppSnackBar.messageSnack('Error : ${post.status}');
    }

    return null;
  }
}
