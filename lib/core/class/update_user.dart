import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/user/auth/login.dart';
import 'package:gpa_pro/data/datasource/remote/user/settings/change_password.dart';
import 'package:gpa_pro/data/datasource/remote/user/settings/change_photo.dart';
import 'package:gpa_pro/data/datasource/remote/user/settings/edit_name.dart';
import 'package:gpa_pro/data/model/user.dart';

class UpdateUser {
  static Future<UserData?> changePassword(
    String email,
    String newPassword, {
    String? messageInDialog,
  }) async {
    ChangePasswordRemotely change = ChangePasswordRemotely(
      newPassword: newPassword,
      email: email,
      messageInDialog: messageInDialog,
    );

    try {
      if (await NetHelper.checkInternet()) {
        UserData? temp = await change.change();
        if (temp != null) {
          await AppInjections.myServices.sharedPreferences.setString(
            SharedKeys.userData,
            temp.copyWith(password: newPassword).toRawJson(),
          );
        }
        return temp;
      } else {
        AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
      }
    } catch (e) {
      AppSnackBar.messageSnack(e.toString());
    }
    return null;
  }

  static Future<UserData?> changePhoto(
    String email,
    File? file, {
    String? messageInDialog,
  }) async {
    ChangePhotoRemotely change = ChangePhotoRemotely(
      file,
      email,
      messageInDialog: messageInDialog,
    );

    try {
      if (await NetHelper.checkInternet()) {
        UserData _ = LoginRemotely.savedLogin()!;

        UserData? temp = await change.change();

        // // Not Work in Windows
        // await DefaultCacheManager().emptyCache();
        CachedNetworkImage.evictFromCache("${AppLinks.image}/${_.userImage}");

        if (temp != null) {
          await AppInjections.myServices.sharedPreferences.setString(
            SharedKeys.userData,
            temp.copyWith(password: _.password).toRawJson(),
          );
        }
        return temp;
      } else {
        AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
      }
    } catch (e) {
      AppSnackBar.messageSnack(e.toString());
    }
    return null;
  }

  static Future<UserData?> editName({
    required String firstName,
    required String lastName,
    required String email,
    String? messageInDialog,
  }) async {
    EditNameRemotely change = EditNameRemotely(
      firstName: firstName,
      lastName: lastName,
      email: email,
      messageInDialog: messageInDialog,
    );

    try {
      if (await NetHelper.checkInternet()) {
        UserData? temp = await change.change();
        if (temp != null) {
          UserData _ = LoginRemotely.savedLogin()!;

          await AppInjections.myServices.sharedPreferences.setString(
            SharedKeys.userData,
            temp.copyWith(password: _.password).toRawJson(),
          );
        }
        return temp;
      } else {
        AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
      }
    } catch (e) {
      AppSnackBar.messageSnack(e.toString());
    }
    return null;
  }
}
