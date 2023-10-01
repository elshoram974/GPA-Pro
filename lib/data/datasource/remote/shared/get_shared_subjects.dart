import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/ads/class/rewarded_interstitial_ads.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/crud.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/shared/get_shared_subjects_model.dart';

class GetSharedSubjects {
  static Future<SharedSubjectsData?> getAllSubjects(
      String? userSharedId) async {
    if (userSharedId != null) {
      Crud crud = const Crud();
      ({Map body, StatusRequest status}) subjects =
          await crud.getData('${AppLinks.getShared}$userSharedId');

      if (subjects.status == StatusRequest.success) {
        SharedSubject sharedSubject =
            SharedSubject.fromJson(subjects.body as Map<String, dynamic>);
        SharedSubjectsData subjectsData = sharedSubject.data;

        if (sharedSubject.status == 'success') {
          return subjectsData;
        } else {
          AppSnackBar.messageSnack('${subjectsData.message?.tr}');
        }
      } else if (subjects.status != StatusRequest.offlineFailure) {
        AppSnackBar.messageSnack('Error : ${subjects.status}');
      }
      // AppSnackBar.messageSnack('Error : ${subjects.status}');
    }
    Navigator.popUntil(Get.context!, (route) => route.isFirst);
    return null;
  }

  static Future<void> getSubjects(String? link) async {
    // https://gpapro.mrecode.com/?user_sharedId=8588913772

    if (link != null) {
      Uri uri = Uri.parse(link);
      String? sharedId = uri.queryParameters['user_sharedId'];

      if (sharedId != null) {
        AppSnackBar.messageSnack(sharedId);
        SharedSubjectsData? subjectsData = await getAllSubjects(sharedId);

        if (subjectsData != null) {
          Get.back();
          bool watchAd = await RewardedInterstitialAdsHelper.showAd();
          if (watchAd) {
            Get.toNamed(
              AppRoute.uploadScreen,
              arguments: UploadArguments(
                title: AppConstLang.sharedSubjects.tr,
                newSubjects: subjectsData.subjects,
              ),
            );
          }
        }
      } else {
        Get.back();
        AppSnackBar.messageSnack(AppConstLang.errorInLink.tr);
      }
    }
  }
}
