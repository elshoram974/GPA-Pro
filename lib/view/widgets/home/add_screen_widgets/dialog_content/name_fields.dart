import 'package:gpa_pro/controller/home/add_controller/dialog_controller.dart';
import 'package:gpa_pro/core/class/subject_helper.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/my_auto_complete_field.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/dialog_content/name_suggestions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameFields extends StatelessWidget {
  const NameFields({super.key, required this.dialogController});
  final DialogControllerImp dialogController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyAutoCompleteField(
            controller: dialogController.nameArController,
            labelText: AppConstLang.nameAr.tr,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            validator: (value) =>
                AppValidator.validInput(value, 2, 35, ValidType.name),
            itemBuilder: (BuildContext fieldContext, Object? suggestion) {
              SubjectModel subject = suggestion as SubjectModel;

              return NameSuggestions(subject: subject, isArabic: true);
            },
            onSuggestionSelected: (suggestion) => dialogController
                .onSelectAutoCompleteField(suggestion, AutoCompleteType.name),
            suggestionsCallback: (String pattern) {
              List<SubjectModel> temp = [];
              List<SubjectModel> s = AppInjections.homeController.subjects;
              temp.addAll(SubjectHelper(s).searchSubjectByName(pattern));
              return temp;
            },
          ),
        ),
        Expanded(
          child: MyAutoCompleteField(
            controller: dialogController.nameEnController,
            labelText: AppConstLang.nameEn.tr,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            validator: (value) =>
                AppValidator.validInput(value, 2, 35, ValidType.name),
            itemBuilder: (BuildContext fieldContext, Object? suggestion) {
              SubjectModel subject = suggestion as SubjectModel;

              return NameSuggestions(subject: subject, isArabic: false);
            },
            onSuggestionSelected: (suggestion) => dialogController
                .onSelectAutoCompleteField(suggestion, AutoCompleteType.name),
            suggestionsCallback: (String pattern) {
              List<SubjectModel> temp = [];

              List<SubjectModel> s = AppInjections.homeController.subjects;
              temp.addAll(SubjectHelper(s).searchSubjectByName(pattern));

              return temp;
            },
          ),
        ),
      ],
    );
  }
}
