import 'package:gpa_pro/controller/initialize/edit_grade_controller.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:gpa_pro/view/widgets/initialize/edit_table/add_remove_btns.dart';
import 'package:gpa_pro/view/widgets/initialize/edit_table/edit_grades_view.dart';
import 'package:gpa_pro/view/widgets/initialize/edit_table/saved_cancel_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditGradesScreen extends StatelessWidget {
  const EditGradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EditGradeControllerImp editController = Get.find<EditGradeControllerImp>();

    return WillPopScope(
      onWillPop: editController.onWillPop,
      child: SelectionArea(
        child: Scaffold(
          appBar: AppBar(title: Text(AppConstLang.editGrades.tr)),
          body: const CustomBodyListView(
            children: [
              EditGradeTable(),
              SizedBox(height: 10),
              AddAndRemoveBtn(),
              SizedBox(height: 30),
              SaveAndCancelBtn(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
