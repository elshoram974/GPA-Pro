import 'package:gpa_pro/controller/home/add_controller/dialog_controller.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubMaxDegrees extends StatelessWidget {
  const SubMaxDegrees({super.key, required this.dialogController});

  final DialogControllerImp dialogController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: MyDefaultField(
            isDouble: true,
            labelText: AppConstLang.practicalDegree.tr,
            controller: dialogController.maxPracticalDegreeController,
            onChanged: (val) => dialogController.onChangedSubMaxDegree(),
            validator: (val) => AppValidator.validSubDegrees(val, 0, 7),
          ),
        ),
        Expanded(
          child: MyDefaultField(
            isDouble: true,
            labelText: AppConstLang.yearWorkDegree.tr,
            controller: dialogController.maxYearWorkDegreeController,
            onChanged: (val) => dialogController.onChangedSubMaxDegree(),
            validator: (val) => AppValidator.validSubDegrees(val, 0, 7),
          ),
        ),
        Expanded(
          child: MyDefaultField(
            isDouble: true,
            labelText: AppConstLang.midDegree.tr,
            controller: dialogController.maxMidDegreeController,
            onChanged: (val) => dialogController.onChangedSubMaxDegree(),
            validator: (val) => AppValidator.validSubDegrees(val, 0, 7),
          ),
        ),
        Expanded(
          child: MyDefaultField(
            isDouble: true,
            labelText: AppConstLang.finalDegree.tr,
            controller: dialogController.maxFinalDegreeController,
            onChanged: (val) => dialogController.onChangedSubMaxDegree(),
            validator: (val) => AppValidator.validSubDegrees(val, 0, 7),
          ),
        ),
      ],
    );
  }
}
