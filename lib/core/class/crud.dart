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
    Map body,
    //  {
    // bool wantBack = false,
    // }
  ) async {
    while (Get.isSnackbarOpen) {
      await Get.closeCurrentSnackbar();
    }
    CustomDialog.loadDialog(canBack: false);
    try {
      if (await NetHelper.checkInternet()) {
        http.Response response = await http.post(Uri.parse(url), body: body);
        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = json.decode(response.body);
          // if (wantBack) Get.back();
          Get.back();

          return (status: StatusRequest.success, body: responseBody);
        }
        return (status: StatusRequest.serverFailure, body: {});
      } else {
        // if (wantBack) Get.back();
        if (Get.isSnackbarOpen) Get.closeAllSnackbars();

        Get.back();
        AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
        return (status: StatusRequest.offlineFailure, body: {});
      }
    } catch (e) {
      // if (wantBack) Get.back();
      if (Get.isSnackbarOpen) Get.closeAllSnackbars();
      Get.back();

      AppSnackBar.messageSnack("e : $e");

      return (status: StatusRequest.serverFailure, body: {});
    }
  }

  Future<({StatusRequest status, Map body})> getData(String url
      //   , {
      //   bool wantBack = false,
      // }
      ) async {
    CustomDialog.loadDialog(canBack: false);

    try {
      if (await NetHelper.checkInternet()) {
        http.Response response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = json.decode(response.body);
          return (status: StatusRequest.success, body: responseBody);
        }
        return (status: StatusRequest.serverFailure, body: {});
      } else {
        // if (wantBack) Get.back();
        if (Get.isSnackbarOpen) Get.closeAllSnackbars();
        Get.back();
        AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
        return (status: StatusRequest.offlineFailure, body: {});
      }
    } catch (e) {
      // if (wantBack) Get.back();
      if (Get.isSnackbarOpen) Get.closeAllSnackbars();
      Get.back();

      AppSnackBar.messageSnack("e : $e");

      return (status: StatusRequest.serverFailure, body: {});
    }
  }

  // Future<Either<StatusRequest, Map<String, dynamic>>> postData(
  //   String url,
  //   Map body,
  // ) async {
  //   try {
  //     if (await NetHelper.checkInternet()) {
  //       http.Response response = await http.post(Uri.parse(url), body: body);
  //       if (response.statusCode == 200) {
  //         Map<String, dynamic> responseBody = json.decode(response.body);
  //         return Right(responseBody);
  //       }
  //       return const Left(StatusRequest.serverFailure);
  //     } else {
  //       return const Left(StatusRequest.offlineFailure);
  //     }
  //   } catch (e) {
  //     return const Left(StatusRequest.serverFailure);
  //   }
  // }
}
