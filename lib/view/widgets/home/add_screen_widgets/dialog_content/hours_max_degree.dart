import 'package:gpa_pro/controller/home/add_controller/dialog_controller.dart';
import 'package:gpa_pro/core/functions/gpa_functions.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoursMaxDegree extends StatelessWidget {
  const HoursMaxDegree({super.key, required this.dialogController});
  final DialogControllerImp dialogController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: MyDefaultField(
            isDouble: true,
            labelText: AppConstLang.noHour.tr,
            controller: dialogController.hoursController,
            validator: (value) =>
                AppValidator.validInput(value, 1, 3, ValidType.hour),
          ),
        ),
        Expanded(
          child: MyDefaultField(
            isDouble: true,
            labelText: AppConstLang.maxDegree.tr,
            controller: dialogController.maxDegreeController,
            onChanged: (val) {
              dialogController.onChanged(
                dialogController.gradeController.text,
                GradeType.grade,
              );
              dialogController.clearSubMaxDegrees();
            },
            validator: (value) =>
                AppValidator.validInput(value, 1, 10, ValidType.degree),
          ),
        ),
      ],
    );
  }
}
