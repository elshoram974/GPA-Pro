import 'package:gpa_pro/controller/home/subject_controller.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectName extends StatelessWidget {
  const SubjectName(this.controller, {super.key});
  final SubjectControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyDefaultField(
            controller: controller.nameArController,
            labelText: AppConstLang.nameAr.tr,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            onChanged: (val) => controller.edit(),
            validator: (value) =>
                AppValidator.validInput(value, 2, 35, ValidType.name),
          ),
        ),
        Expanded(
          child: MyDefaultField(
            controller: controller.nameEnController,
            labelText: AppConstLang.nameEn.tr,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            onChanged: (val) => controller.edit(),
            validator: (value) =>
                AppValidator.validInput(value, 2, 35, ValidType.name),
          ),
        ),
      ],
    );
  }
}
