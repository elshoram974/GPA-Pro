import 'package:gpa_pro/controller/home/subject_controller.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectIsCalCulated extends StatelessWidget {
  const SubjectIsCalCulated({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubjectControllerImp>(
      builder: (controller) {
        return CheckboxListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          dense: true,
          title: Text(AppConstLang.wantToCalcIt.tr),
          subtitle: Text(AppConstLang.doUWantToCalculateIt.tr),
          value: controller.editedSubject.isCalculated,
          onChanged: controller.onChangeCalculated,
        );
      },
    );
  }
}
