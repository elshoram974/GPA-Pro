import 'dart:convert';

import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:dartz/dartz.dart';

class Crud {
  Future<({StatusRequest status, Map body})> postData(
    String url,
    Map body,
  ) async {
    try {
      if (await NetHelper.checkInternet()) {
        http.Response response = await http.post(Uri.parse(url), body: body);
        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = json.decode(response.body);
          return (status: StatusRequest.success, body: responseBody);
        }
        return (status: StatusRequest.serverFailure, body: {});
      } else {
        AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
        return (status: StatusRequest.offlineFailure, body: {});
      }
    } catch (e) {
      AppSnackBar.messageSnack("e : $e");

      return (status: StatusRequest.serverFailure, body: {});
    }
  }

  Future<({StatusRequest status, Map body})> getData(String url) async {
    try {
      if (await NetHelper.checkInternet()) {
        http.Response response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = json.decode(response.body);
          return (status: StatusRequest.success, body: responseBody);
        }
        return (status: StatusRequest.serverFailure, body: {});
      } else {
        return (status: StatusRequest.offlineFailure, body: {});
      }
    } catch (e) {
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
