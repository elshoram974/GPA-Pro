import 'package:gpa_pro/controller/home/add_controller/dialog_controller.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubSubjectDegrees extends StatelessWidget {
  const SubSubjectDegrees({super.key, required this.dialogController});

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
            controller: dialogController.myPracticalDegreeController,
            onChanged: (val) => dialogController.onChangedSubSubjectDegree(),
            validator: (val) => AppValidator.validSubDegrees(
              val,
              0,
              7,
              maxVal: double.tryParse(
                      dialogController.maxPracticalDegreeController.text) ??
                  0.0,
            ),
          ),
        ),
        Expanded(
          child: MyDefaultField(
            isDouble: true,
            labelText: AppConstLang.yearWorkDegree.tr,
            controller: dialogController.myYearWorkDegreeController,
            onChanged: (val) => dialogController.onChangedSubSubjectDegree(),
            validator: (val) => AppValidator.validSubDegrees(
              val,
              0,
              7,
              maxVal: double.tryParse(
                      dialogController.maxYearWorkDegreeController.text) ??
                  0.0,
            ),
          ),
        ),
        Expanded(
          child: MyDefaultField(
            isDouble: true,
            labelText: AppConstLang.midDegree.tr,
            controller: dialogController.myMidDegreeController,
            onChanged: (val) => dialogController.onChangedSubSubjectDegree(),
            validator: (val) => AppValidator.validSubDegrees(
              val,
              0,
              7,
              maxVal: double.tryParse(
                      dialogController.maxMidDegreeController.text) ??
                  0.0,
            ),
          ),
        ),
        Expanded(
          child: MyDefaultField(
            isDouble: true,
            labelText: AppConstLang.finalDegree.tr,
            controller: dialogController.myFinalDegreeController,
            onChanged: (val) => dialogController.onChangedSubSubjectDegree(),
            validator: (val) => AppValidator.validSubDegrees(
              val,
              0,
              7,
              maxVal: double.tryParse(
                      dialogController.maxFinalDegreeController.text) ??
                  0.0,
            ),
          ),
        ),
      ],
    );
  }
}
