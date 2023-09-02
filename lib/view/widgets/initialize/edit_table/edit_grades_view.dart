import 'package:gpa_pro/controller/initialize/edit_grade_controller.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/data/model/grades_model.dart';
import 'package:gpa_pro/view/widgets/initialize/table_shared/table_body.dart';
import 'package:gpa_pro/view/widgets/initialize/table_shared/table_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditGradeTable extends StatelessWidget {
  const EditGradeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditGradeControllerImp>(
      builder: (controller) {
        List<Grade> grades = controller.editGrades;
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller.gradesKey,
          child: Table(
            columnWidths: const {0: FlexColumnWidth(0.3)},
            border: TableBorder(
              verticalInside: BorderSide(color: AppColor.tableColor(context)),
              horizontalInside: BorderSide(color: AppColor.tableColor(context)),
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableHeader(context, isEditPage: true),
              for (int i = 0; i < grades.length; i++)
                InfoTableRow(
                  context: context,
                  column: i,
                  grades: grades,
                  isEditPage: true,
                ),
            ],
          ),
        );
      },
    );
  }
}
