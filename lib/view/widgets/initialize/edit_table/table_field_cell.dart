import 'package:gpa_pro/controller/initialize/edit_grade_controller.dart';
import 'package:gpa_pro/core/class/cell_field_model.dart';
import 'package:gpa_pro/data/model/grades_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableFieldCell extends StatelessWidget {
  final CellFieldModel cellFieldModel;
  final String cellData;
  const TableFieldCell({
    super.key,
    required this.cellFieldModel,
    required this.cellData,
  });

  @override
  Widget build(BuildContext context) {
    EditGradeControllerImp grade = Get.find<EditGradeControllerImp>();
    // CellFieldModel cellField = grade.cellField[cellFieldModel.cellIndex];

    // cellFieldModel.controller = cellField.controller;
    // cellFieldModel.focusNodes = cellField.focusNodes;
    // // cellFieldModel.controller!.text = cellData;

    // // // grade.controllers.add(controller);
    // // grade.focusNodes.add(cellFieldModel.focusNodes);
    List<Grade> editGrades = [];
    editGrades.addAll(grade.editGrades);

    return TextFormField(
      // focusNode: cellFieldModel.focusNodes,
      textAlign: TextAlign.center,
      // controller: cellFieldModel.controller,
      // onTap: () {
      //   if (!cellFieldModel.focusNodes!.hasFocus) {
      //     cellFieldModel.controller!.selection = TextSelection(
      //       baseOffset: 0,
      //       extentOffset: cellFieldModel.controller!.text.length,
      //     );
      //   }
      // },
      textCapitalization: TextCapitalization.characters,
      initialValue: cellData,
      // maxLength: cellFieldModel.cellFieldType == CellFieldType.grade ? 2 : 5,
      keyboardType: cellFieldModel.cellFieldType == CellFieldType.grade
          ? TextInputType.text
          : TextInputType.number,
      decoration: const InputDecoration(
        errorMaxLines: 10,
        counterText: '',
        border: InputBorder.none,
      ),
      textInputAction: cellFieldModel.column == editGrades.length - 1 &&
              cellFieldModel.cellFieldType == CellFieldType.gpa
          ? TextInputAction.done
          : TextInputAction.next,
      onEditingComplete: cellFieldModel.column == editGrades.length - 1 &&
              cellFieldModel.cellFieldType == CellFieldType.gpa
          ? grade.save
          : null,
      onSaved: (newValue) => grade.onSavedValid(newValue, cellFieldModel),
      validator: (value) => grade.validators(value, cellFieldModel),
      onChanged: (value) => grade.onChange(value, cellFieldModel),
    );
  }
}
