import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableTextCell extends StatelessWidget {
  final String cellData;
  final bool isTitle;
  const TableTextCell({
    super.key,
    required this.cellData,
    this.isTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstant.kDefaultPadding / 3,
          ),
          child: Text(
            cellData,
            textAlign: TextAlign.center,
            style: isTitle
                ? context.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  )
                : context.textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
