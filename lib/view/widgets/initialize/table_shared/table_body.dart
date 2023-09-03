import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/class/cell_field_model.dart';
import 'package:gpa_pro/data/model/grades_model.dart';
import 'package:gpa_pro/view/widgets/initialize/edit_table/color_cell.dart';
import 'package:gpa_pro/view/widgets/initialize/initialize/table_text_cell.dart';
import 'package:gpa_pro/view/widgets/initialize/table_shared/table_cell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoTableRow extends TableRow {
  final bool isEditPage;
  final List<Grade> grades;
  final int column;
  final BuildContext context;
  const InfoTableRow({
    super.key,
    required this.context,
    required this.column,
    required this.grades,
    required this.isEditPage,
  });
  @override
  List<Widget> get children {
    return [
      TableTextCell(cellData: "${column + 1}"),
      MyTableCell(
        cellData: grades[column].grade,
        isEditPage: isEditPage,
        cellFieldModel: CellFieldModel(
          column: column,
          cellIndex: column * 3,
          cellFieldType: CellFieldType.grade,
        ),
      ),
      MyTableCell(
        cellData: "${grades[column].degree}",
        isEditPage: isEditPage,
        cellFieldModel: CellFieldModel(
          column: column,
          cellIndex: (column * 3) + 1,
          cellFieldType: CellFieldType.degree,
        ),
      ),
      MyTableCell(
        cellData: "${grades[column].gpa}",
        isEditPage: isEditPage,
        cellFieldModel: CellFieldModel(
          column: column,
          cellIndex: (column * 3) + 2,
          cellFieldType: CellFieldType.gpa,
        ),
      ),
      if (isEditPage) ...[
        ColorCell(
          context: context,
          grades: grades,
          column: column,
        ),
      ]
    ];
  }

  @override
  Decoration? get decoration {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(color: AppColor.tableColor(context)),
        left: BorderSide(color: AppColor.tableColor(context)),
        right: BorderSide(color: AppColor.tableColor(context)),
        top: BorderSide(width: 0, color: AppColor.tableColor(context)),
      ),
      color: isEditPage
          ? null
          : (context.isDarkMode
              ? grades[column].darkColor
              : grades[column].lightColor),
      borderRadius: column == grades.length - 1
          ? const BorderRadius.vertical(
              bottom: Radius.circular(AppConstant.kDefaultRadius),
            )
          : null,
    );
  }
}
