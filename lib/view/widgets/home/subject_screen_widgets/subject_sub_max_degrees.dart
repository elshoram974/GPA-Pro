import 'package:gpa_pro/controller/home/subject_controller.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/core/shared/my_label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectSubMaxDegrees extends StatelessWidget {
  const SubjectSubMaxDegrees(this.controller, {super.key});
  final SubjectControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyLabels(AppConstLang.maxDegrees.tr),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: MyDefaultField(
                isDouble: true,
                labelText: AppConstLang.practicalDegree.tr,
                controller: controller.maxPracticalDegreeController,
                onChanged: (val) => controller.onChangedSubMaxDegree(),
                validator: (val) => AppValidator.validSubDegrees(val, 0, 7),
              ),
            ),
            Expanded(
              child: MyDefaultField(
                isDouble: true,
                labelText: AppConstLang.yearWorkDegree.tr,
                controller: controller.maxYearWorkDegreeController,
                onChanged: (val) => controller.onChangedSubMaxDegree(),
                validator: (val) => AppValidator.validSubDegrees(val, 0, 7),
              ),
            ),
            Expanded(
              child: MyDefaultField(
                isDouble: true,
                labelText: AppConstLang.midDegree.tr,
                controller: controller.maxMidDegreeController,
                onChanged: (val) => controller.onChangedSubMaxDegree(),
                validator: (val) => AppValidator.validSubDegrees(val, 0, 7),
              ),
            ),
            Expanded(
              child: MyDefaultField(
                isDouble: true,
                labelText: AppConstLang.finalDegree.tr,
                controller: controller.maxFinalDegreeController,
                onChanged: (val) => controller.onChangedSubMaxDegree(),
                validator: (val) => AppValidator.validSubDegrees(val, 0, 7),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
