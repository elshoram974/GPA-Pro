import 'package:gpa_pro/core/class/cell_field_model.dart';
import 'package:gpa_pro/view/widgets/initialize/edit_table/table_field_cell.dart';
import 'package:gpa_pro/view/widgets/initialize/initialize/table_text_cell.dart';
import 'package:flutter/material.dart';

class MyTableCell extends StatelessWidget {
  final CellFieldModel cellFieldModel;
  final bool isEditPage;
  final String cellData;

  const MyTableCell({
    super.key,
    required this.isEditPage,
    required this.cellFieldModel,
    required this.cellData,
  });

  @override
  Widget build(BuildContext context) {
    return isEditPage
        ? TableFieldCell(cellFieldModel: cellFieldModel, cellData: cellData)
        : TableTextCell(cellData: cellData);
  }
}
