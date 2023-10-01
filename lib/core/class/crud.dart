import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class Crud {
  const Crud();
  Future<({StatusRequest status, Map body})> postData(
    String url,
    Map body, {
    String? messageInDialog,
  }) async {
    Get.closeAllSnackbars();
    CustomDialog.loadDialog(canBack: false, message: messageInDialog);
    ({StatusRequest status, Map body}) ret =
        (status: StatusRequest.loading, body: {});
    try {
      if (await NetHelper.checkInternet()) {
        http.Response response = await http.post(Uri.parse(url), body: body);
        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = json.decode(response.body);
          ret = (status: StatusRequest.success, body: responseBody);
        } else {
          print("${response.statusCode}");
          log("${response.statusCode}");
          ret = (status: StatusRequest.serverFailure, body: {});
        }
      } else {
        AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
        ret = (status: StatusRequest.offlineFailure, body: {});
      }
    } catch (e) {
      if (Get.isSnackbarOpen) Get.closeAllSnackbars();
      print(e.toString());
      log(e.toString());

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
    ({StatusRequest status, Map body}) ret =
        (status: StatusRequest.loading, body: {});

    try {
      if (await NetHelper.checkInternet()) {
        http.Response response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = json.decode(response.body);
          ret = (status: StatusRequest.success, body: responseBody);
        } else {
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

  Future<({StatusRequest status, Map body})> postDataWithFile(
    String url,
    Map body,
    File file, {
    String? messageInDialog,
  }) async {
    Get.closeAllSnackbars();
    CustomDialog.loadDialog(canBack: false, message: messageInDialog);
    ({StatusRequest status, Map body}) ret =
        (status: StatusRequest.loading, body: {});

    try {
      if (await NetHelper.checkInternet()) {
        http.MultipartRequest request =
            http.MultipartRequest("POST", Uri.parse(url));

        int length = await file.length();
        http.ByteStream stream = http.ByteStream(file.openRead());

        http.MultipartFile multiPartFile = http.MultipartFile(
          "image",
          stream,
          length,
          filename: path.basename(file.path),
        );

        request.files.add(multiPartFile);

        body.forEach((key, value) {
          request.fields[key] = value;
        });
        http.StreamedResponse send = await request.send();

        http.Response response = await http.Response.fromStream(send);
        if (send.statusCode == 200) {
          Map<String, dynamic> responseBody = json.decode(response.body);
          ret = (status: StatusRequest.success, body: responseBody);
        } else {
          ret = (status: StatusRequest.serverFailure, body: {});
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
}
