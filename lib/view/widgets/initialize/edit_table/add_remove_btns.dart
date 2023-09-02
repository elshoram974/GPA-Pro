import 'package:gpa_pro/controller/initialize/edit_grade_controller.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAndRemoveBtn extends StatelessWidget {
  const AddAndRemoveBtn({super.key});

  @override
  Widget build(BuildContext context) {
    EditGradeControllerImp editController = Get.find<EditGradeControllerImp>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: editController.addColumn,
          child: Text(AppConstLang.add.tr),
        ),
        ElevatedButton(
          onPressed: editController.removeColumn,
          child: Text(AppConstLang.remove.tr),
        ),
      ],
    );
  }
}
