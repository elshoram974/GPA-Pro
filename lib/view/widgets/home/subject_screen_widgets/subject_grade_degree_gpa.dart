import 'package:gpa_pro/controller/home/add_controller/dialog_controller.dart';
import 'package:gpa_pro/controller/home/subject_controller.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/gpa_functions.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/core/shared/custom_fields/my_auto_complete_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectGradeDegreeGPA extends StatelessWidget {
  const SubjectGradeDegreeGPA(this.controller, {super.key});
  final SubjectControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: MyAutoCompleteField(
            textInputAction: TextInputAction.done,
            labelText: AppConstLang.grade.tr,
            controller: controller.gradeController,
            onChanged: (val) => controller.onChanged(
              val,
              GradeType.grade,
            ),
            validator: (value) => AppValidator.validInput(
              value,
              1,
              8,
              ValidType.grade,
              whenAdd: true,
            ),
            itemBuilder: (BuildContext fieldContext, Object? suggestion) {
              return ListTile(
                title: Text(
                  "$suggestion",
                  textAlign: TextAlign.center,
                ),
              );
            },
            onSuggestionSelected: (suggestion) => controller
                .onSelectAutoCompleteField(suggestion, AutoCompleteType.grade),
            suggestionsCallback: (String pattern) {
              List<String> temp = [];
              temp.addAll(AppInjections.initialize.searchGrades(pattern));
              return temp;
            },
          ),
        ),
        Expanded(
          child: MyDefaultField(
            textInputAction: TextInputAction.done,
            isDouble: true,
            labelText: AppConstLang.degree.tr,
            controller: controller.degreeController,
            onChanged: (val) => controller.onChanged(val, GradeType.degree),
            validator: (value) => AppValidator.validInput(
              value,
              1,
              10,
              ValidType.degree,
              maxVal: double.tryParse(controller.maxDegreeController.text),
            ),
          ),
        ),
        Expanded(
          child: MyDefaultField(
            textInputAction: TextInputAction.done,
            isDouble: true,
            labelText: "GPA",
            controller: controller.gpaController,
            onChanged: (val) => controller.onChanged(
              val,
              GradeType.gpa,
            ),
            validator: (value) => AppValidator.validInput(
              value,
              1,
              8,
              ValidType.gpa,
              whenAdd: true,
            ),
          ),
        ),
      ],
    );
  }
}
