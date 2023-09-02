import 'dart:convert';
import 'dart:io';

import 'package:gpa_pro/controller/saved_subjects_controllers/upload_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/constants/saved_constants.dart';
import 'package:gpa_pro/core/functions/rate_app.dart';
import 'package:gpa_pro/core/functions/save/save_folder.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class SaveText {
  // static HomeControllerImp homeController = AppInjections.homeController;
  static List<SubjectModel> subjectToSave = [];
  static String jsonSubjects = '';

  static Future<String> init() async {
    List<SubjectModel> allSubjects = [];
    allSubjects.addAll(subjectToSave);
    // allSubjects.addAll(await homeController.getSubjects());
    jsonSubjects = jsonEncode(allSubjects);
    return jsonSubjects;
  }

  static Future<void> onTapSave(List<SubjectModel> subjects) async {
    subjectToSave.clear();
    subjectToSave.addAll(subjects);

    String fileName = AppSavedConst.savedTXTName;

    SaveFolder.waitToSaveDialog();

    await init();

    await SaveFolder.saveTxt(fileName, jsonSubjects);

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

    Get.lazyPut<UploadSavedTxtFileImp>(() => UploadSavedTxtFileImp());
    Get.toNamed(
      AppRoute.uploadScreen,
      arguments: UploadArguments(
        title: AppConstLang.savedSubjects.tr,
        newSubjects: newSubjects,
      ),
    );
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
        if (e.extension == "txt") {
          await addSavedSubjects(await File(e.path!).readAsString());
        }
      }
    }
  }
}
