import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gpa_pro/core/ads/class/rewarded_interstitial_ads.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/constants/saved_constants.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/rate_app.dart';
import 'package:gpa_pro/core/functions/save/save_folder.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/data/datasource/remote/shared/get_shared_subjects.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class SaveText {
  static Future<void> onTapSave(List<SubjectModel> subjects) async {
    String fileName = AppSavedConst.savedTXTName;

    SaveFolder.waitToSaveDialog();

    await SaveFolder.saveTxt(fileName, jsonEncode(subjects));

    Get.back();
    Get.back();

    AppSnackBar.messageSnack(AppConstLang.savedInDownload.tr);
    RateApp.rateAppDialog();
  }

  //--------------------
  //------------------------------------------------------------------------------------------
  // to get from here

  static ({List<SubjectModel> subjects, int errors}) getFromJson(
      String myEncodedFile) {
    List fromJsonSubjects = [];

    fromJsonSubjects.addAll(jsonDecode(myEncodedFile));

    List<SubjectModel> subjects = [];
    int errors = 0;
    for (Map<String, dynamic> e in fromJsonSubjects) {
      try {
        subjects.add(SubjectModel.fromJson(e));
      } catch (error) {
        errors++;
      }
    }
    return (subjects: subjects, errors: errors);
  }

  static Future<void> addSavedSubjects(String file) async {
    List<SubjectModel> newSubjects = [];
    ({int errors, List<SubjectModel> subjects}) getAll = getFromJson(file);
    newSubjects.addAll(getAll.subjects);
    Get.back();

    bool watchAd = await RewardedInterstitialAdsHelper.showAd();
    if (watchAd) {
      Get.toNamed(
        AppRoute.uploadScreen,
        arguments: UploadArguments(
          title: AppConstLang.savedSubjects.tr,
          newSubjects: newSubjects,
        ),
      );
    }
    if (getAll.errors != 0) {
      AppSnackBar.messageSnack("${getAll.errors} ${AppConstLang.error.tr}");
    }
  }

  static Future<void> getSavedFileInMemory() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["txt"],
    );

    if (result != null) {
      for (PlatformFile e in result.files) {
        if (e.extension?.toLowerCase() == "txt") {
          File file = File(e.path!);

          await addSavedSubjects(await file.readAsString());
          if (await file.exists()) await file.delete();
        }
      }
    }
  }

  static Future<void> getSubjectsWithLink() async {
    String link = '';
    Future<void> thisFunction() async {
      Get.back();
      CustomDialog.loadDialog();
      await GetSharedSubjects.getSubjects(link);
    }

    await Get.defaultDialog(
      buttonColor: AppColor.primary,
      confirmTextColor: Colors.white,
      title: '',
      titlePadding: EdgeInsets.zero,
      textConfirm: AppConstLang.go.tr,
      content: Column(
        children: [
          Text(AppConstLang.enterLinkAndGo.tr),
          MyDefaultField(
            onFieldSubmitted: (val) async => thisFunction(),
            onChanged: (val) => link = val.trim(),
          ),
        ],
      ),
      onConfirm: thisFunction,
    );
  }
}
