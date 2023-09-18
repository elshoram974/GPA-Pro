import 'package:gpa_pro/controller/edit_subject_controller.dart';
import 'package:gpa_pro/controller/home/add_controller/add_controller.dart';
import 'package:gpa_pro/core/class/subjects/subject_helper.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/gpa_functions.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AutoCompleteType { name, grade }

abstract class DialogController extends EditSubjectControllerImp {
  void onChangeCalculated(bool? newVal);

  void onAdd();
  Future<bool> isSubjectExistAndCancelOld();

  void initialValue();
}

class DialogControllerImp extends DialogController {
  final AddControllerImp _ = Get.find<AddControllerImp>();

  @override
  void onInit() {
    super.onInit();
    initialValue();
  }

  @override
  void onChangeCalculated(bool? newVal) => {isCalculated = newVal!, update()};

  @override
  void onAdd() async {
    FormState state = formKey.currentState!;
    List<String> namesEn = [];
    List<String?> namesAr = [];
    for (SubjectModel e in _.subjectsList) {
      namesEn.add(e.nameEn);
      namesAr.add(e.nameAr);
    }

    if (nameEnController.text.trim().isEmpty) {
      nameEnController.text = nameArController.text;
    }
    if (nameArController.text.trim().isEmpty) {
      nameArController.text = nameEnController.text;
    }

    if (state.validate()) {
      // if it exist in all subjects
      if (await isSubjectExistAndCancelOld()) return;

      state.save();
      SubjectModel subject = SubjectModel(
        id: _.subjectsList.length,
        nameEn: nameEnController.text,
        nameAr: nameArController.text,
        semester: _.semester!,
        year: _.year!,
        degree: double.parse(degreeController.text),
        hours: int.parse(hoursController.text),
        maxDegree: double.parse(maxDegreeController.text),
        isCalculated: isCalculated,
        isNeedSync: true,
        savedGPA: savedGPA,
        myPracticalDegree: double.tryParse(myPracticalDegreeController.text),
        myYearWorkDegree: double.tryParse(myYearWorkDegreeController.text),
        myMidDegree: double.tryParse(myMidDegreeController.text),
        myFinalDegree: double.tryParse(myFinalDegreeController.text),
        maxPracticalDegree: double.tryParse(maxPracticalDegreeController.text),
        maxYearWorkDegree: double.tryParse(maxYearWorkDegreeController.text),
        maxMidDegree: double.tryParse(maxMidDegreeController.text),
        maxFinalDegree: double.tryParse(maxFinalDegreeController.text),
        note: _.subjectModel?.note,
      );

      if (_.subjectModel == null) {
        // if it exist in add list

        if (namesEn.contains(nameEnController.text)) {
          CustomDialog.errorDialog(
            "${nameEnController.text}\n${AppConstLang.thisSubjectAlreadyExistInAddedList.tr}",
          );
          return;
        } else if (namesAr.contains(nameArController.text)) {
          CustomDialog.errorDialog(
            "${nameArController.text}\n${AppConstLang.thisSubjectAlreadyExistInAddedList.tr}",
          );
          return;
        }

        // to insert in list
        {
          _.subjectsList.insert(0, subject);
          _.listKey.currentState!.insertItem(0);
        }
      } else {
        subject.id = _.subjectModel!.id;
        _.subjectsList[_.index] = subject;
      }
      Get.back();

      _.update();
    }
  }

  @override
  Future<bool> isSubjectExistAndCancelOld() async {
    bool ok = false;

    if (!isCalculated) return false;

    Set<SubjectModel> searchedSubjects = {};
    SubjectHelper subjectHelper = SubjectHelper(_.allSubjectsWithoutAdded());

    searchedSubjects.addAll(
        subjectHelper.searchCalcSubjectByAllName(nameEnController.text, true));

    searchedSubjects.addAll(
        subjectHelper.searchCalcSubjectByAllName(nameArController.text, true));

    if (searchedSubjects.isNotEmpty) {
      String body = "";
      for (SubjectModel searchedSubject in searchedSubjects) {
        body += "\n - ${searchedSubject.address}";
      }
      await CustomDialog.warningBeforeConfirm<bool>(
        "${AppConstLang.addSubjectUHaveToNotCalculatedItIn.tr} $body",
        () async {
          ok = true;
          for (SubjectModel temp in searchedSubjects) {
            await SubjectTableDB.update(temp
              ..isCalculated = false
              ..isNeedSync = true);
          }
          await AppInjections.homeController.getSubjects();
        },
      );
      return !ok;
    }
    return false;
  }

  @override
  void initialValue() {
    isCalculated = true;
    maxDegreeController.text = "100";

    if (_.subjectModel != null) {
      fillControllersBySubject(_.subjectModel!);

      onChanged(degreeController.text, GradeType.degree);
      gpaController.text = "${_.subjectModel!.gpa}";
    }
  }
}
