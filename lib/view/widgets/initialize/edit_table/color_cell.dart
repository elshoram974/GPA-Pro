import 'package:gpa_pro/controller/initialize/edit_grade_controller.dart';
import 'package:gpa_pro/core/constants/dimensions.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/grades_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorCell extends StatelessWidget {
  const ColorCell({
    super.key,
    required this.context,
    required this.grades,
    required this.column,
  });

  final BuildContext context;
  final List<Grade> grades;
  final int column;

  @override
  Widget build(BuildContext context) {
    EditGradeControllerImp editController = Get.find<EditGradeControllerImp>();
    double columnHeight = AppDimension.getColorCellSizeFromFontSize(context);

    return ClipRRect(
      borderRadius: column == grades.length - 1
          ? BorderRadius.only(
              bottomRight: AppInjections.locale.isArabicLang
                  ? Radius.zero
                  : const Radius.circular(AppConstant.kDefaultRadius),
              bottomLeft: AppInjections.locale.isArabicLang
                  ? const Radius.circular(AppConstant.kDefaultRadius)
                  : Radius.zero,
            )
          : BorderRadius.zero,
      child: Row(
        children: [
          Expanded(
            child: Tooltip(
              message: AppConstLang.lightColor.tr,
              child: InkWell(
                onTap: () => CustomDialog.colorPicker(
                  context,
                  pickerColor: grades[column].lightColor,
                  onConfirm: (Color? color) {
                    editController.changeColor(color, column, false);
                  },
                ),
                child: Container(
                  height: columnHeight,
                  color: grades[column].lightColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Tooltip(
              message: AppConstLang.darkColor.tr,
              child: InkWell(
                onTap: () => CustomDialog.colorPicker(
                  context,
                  pickerColor: grades[column].darkColor,
                  onConfirm: (Color? color) {
                    editController.changeColor(color, column, true);
                  },
                ),
                child: Container(
                  height: columnHeight,
                  color: grades[column].darkColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
