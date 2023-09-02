import 'package:gpa_pro/controller/initialize/edit_grade_controller.dart';
import 'package:gpa_pro/core/constants/dimensions.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveAndCancelBtn extends StatelessWidget {
  const SaveAndCancelBtn({super.key});

  @override
  Widget build(BuildContext context) {
    EditGradeControllerImp editController = Get.find<EditGradeControllerImp>();

    return Wrap(
      spacing: 50,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width < AppDimension.maxPhone
              ? double.infinity
              : 300,
          child: ElevatedButton(
            onPressed: editController.save,
            child: Text(AppConstLang.save.tr),
          ),
        ),
        TextButton(
          onPressed: () => editController.cancel(),
          child: Text(AppConstLang.cancel.tr),
        ),
      ],
    );
  }
}
