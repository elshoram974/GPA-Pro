import 'package:gpa_pro/controller/home/subject_controller.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/core/shared/my_label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectSubSubjectDegrees extends StatelessWidget {
  const SubjectSubSubjectDegrees(this.controller, {super.key});
  final SubjectControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyLabels(AppConstLang.yourDegrees.tr),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: MyDefaultField(
                isDouble: true,
                labelText: AppConstLang.practicalDegree.tr,
                controller: controller.myPracticalDegreeController,
                onChanged: (val) => controller.onChangedSubSubjectDegree(),
                validator: (val) => AppValidator.validSubDegrees(
                  val,
                  0,
                  7,
                  maxVal: double.tryParse(
                          controller.maxPracticalDegreeController.text) ??
                      0.0,
                ),
              ),
            ),
            Expanded(
              child: MyDefaultField(
                isDouble: true,
                labelText: AppConstLang.yearWorkDegree.tr,
                controller: controller.myYearWorkDegreeController,
                onChanged: (val) => controller.onChangedSubSubjectDegree(),
                validator: (val) => AppValidator.validSubDegrees(
                  val,
                  0,
                  7,
                  maxVal: double.tryParse(
                          controller.maxYearWorkDegreeController.text) ??
                      0.0,
                ),
              ),
            ),
            Expanded(
              child: MyDefaultField(
                isDouble: true,
                labelText: AppConstLang.midDegree.tr,
                controller: controller.myMidDegreeController,
                onChanged: (val) => controller.onChangedSubSubjectDegree(),
                validator: (val) => AppValidator.validSubDegrees(
                  val,
                  0,
                  7,
                  maxVal:
                      double.tryParse(controller.maxMidDegreeController.text) ??
                          0.0,
                ),
              ),
            ),
            Expanded(
              child: MyDefaultField(
                isDouble: true,
                labelText: AppConstLang.finalDegree.tr,
                controller: controller.myFinalDegreeController,
                onChanged: (val) => controller.onChangedSubSubjectDegree(),
                validator: (val) => AppValidator.validSubDegrees(
                  val,
                  0,
                  7,
                  maxVal: double.tryParse(
                          controller.maxFinalDegreeController.text) ??
                      0.0,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
