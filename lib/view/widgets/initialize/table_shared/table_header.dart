import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/initialize/initialize/table_text_cell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableHeader extends TableRow {
  final bool isEditPage;
  final BuildContext context;
  const TableHeader(this.context, {required this.isEditPage});
  @override
  List<Widget> get children {
    return [
      const TableTextCell(cellData: "#", isTitle: true),
      TableTextCell(cellData: AppConstLang.grade.tr, isTitle: true),
      TableTextCell(cellData: AppConstLang.degree.tr, isTitle: true),
      const TableTextCell(cellData: "GPA", isTitle: true),
      if (isEditPage) ...[
        TableTextCell(cellData: AppConstLang.color.tr, isTitle: true),
        // const Icon(Icons.expand_more_outlined),
      ],
    ];
  }

  @override
  Decoration? get decoration {
    return BoxDecoration(
      border: Border.all(color: AppColor.tableColor(context)),
      borderRadius:const BorderRadius.vertical(
        top: Radius.circular(AppConstant.kDefaultRadius),
      ),
    );
  }
}
