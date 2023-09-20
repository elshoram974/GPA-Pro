import 'dart:convert';

import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<({StatusRequest status, Map body})> postData(
    String url,
    Map body, {
    String? messageInDialog,
  }) async {
    Get.closeAllSnackbars();
    CustomDialog.loadDialog(canBack: false, message: messageInDialog);
    ({StatusRequest status, Map body}) ret = (status: StatusRequest.loading, body: {});
    try {
      if (await NetHelper.checkInternet()) {
        http.Response response = await http.post(Uri.parse(url), body: body);
        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = json.decode(response.body);
          ret = (status: StatusRequest.success, body: responseBody);
        } else {
          ret = (status: StatusRequest.loading, body: {});
        }
      } else {
        AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
        ret = (status: StatusRequest.offlineFailure, body: {});
      }
    } catch (e) {
      if (Get.isSnackbarOpen) Get.closeAllSnackbars();

      AppSnackBar.messageSnack("e : $e");

      ret = (status: StatusRequest.serverFailure, body: {});
    }
    try {
      while (Get.isSnackbarOpen) {
        await Get.closeCurrentSnackbar();
      }
      Get.back();
    } catch (e) {
      Get.back();
    }
    return ret;
  }

  Future<({StatusRequest status, Map body})> getData(String url) async {
    CustomDialog.loadDialog(canBack: false);
    ({StatusRequest status, Map body}) ret = (status: StatusRequest.loading, body: {});

    try {
      if (await NetHelper.checkInternet()) {
        http.Response response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = json.decode(response.body);
          ret = (status: StatusRequest.success, body: responseBody);
        }else{
          ret = (status: StatusRequest.serverFailure, body: {});
        }
      } else {
        if (Get.isSnackbarOpen) Get.closeAllSnackbars();
        Get.back();
        AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
        ret = (status: StatusRequest.offlineFailure, body: {});
      }
    } catch (e) {
      if (Get.isSnackbarOpen) Get.closeAllSnackbars();
      Get.back();

      AppSnackBar.messageSnack("e : $e");

      ret = (status: StatusRequest.serverFailure, body: {});
    }
    try {
      while (Get.isSnackbarOpen) {
        await Get.closeCurrentSnackbar();
      }
      Get.back();
    } catch (e) {
      Get.back();
    }
    return ret;
  }
}
