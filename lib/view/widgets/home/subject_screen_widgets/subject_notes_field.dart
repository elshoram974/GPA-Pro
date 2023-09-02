import 'package:gpa_pro/controller/home/subject_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectNotesField extends StatelessWidget {
  const SubjectNotesField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubjectControllerImp>(builder: (controller) {
      return MyDefaultField(
        controller: controller.noteController,
        labelText: AppConstLang.notes.tr,
        textAlignVertical: TextAlignVertical.bottom,
        verticalPadding: AppConstant.kDefaultPadding,
        alignLabelWithHint: true,
        textCapitalization: TextCapitalization.sentences,
        onChanged: (val) => {
          controller.editedSubject.note = val.trim(),
          controller.changeNoteDir(),
        },
        textAlign: TextAlign.justify,
        textInputAction: TextInputAction.none,
        textDirection: controller.noteDir,
        maxLines: 8,
        minLines: 4,
      );
    });
  }
}
