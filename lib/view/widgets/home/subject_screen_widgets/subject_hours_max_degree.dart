import 'package:gpa_pro/controller/home/subject_controller.dart';
import 'package:gpa_pro/core/functions/gpa_functions.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectHoursMaxDegree extends StatelessWidget {
  const SubjectHoursMaxDegree(this.controller, {super.key});
  final SubjectControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: MyDefaultField(
            isDouble: true,
            labelText: AppConstLang.noHour.tr,
            controller: controller.hoursController,
            onChanged: (val) => controller.updateText(),
            validator: (value) =>
                AppValidator.validInput(value, 1, 3, ValidType.hour),
          ),
        ),
        Expanded(
          child: MyDefaultField(
            isDouble: true,
            labelText: AppConstLang.maxDegree.tr,
            controller: controller.maxDegreeController,
            onChanged: (val) {
              controller.onChanged(
                controller.gradeController.text,
                GradeType.grade,
              );
              controller.updateText();
              controller.clearSubMaxDegrees();
            },
            validator: (value) =>
                AppValidator.validInput(value, 1, 10, ValidType.degree),
          ),
        ),
      ],
    );
  }
}
