import 'package:gpa_pro/controller/home/add_controller/add_controller.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_drop_down_button.dart';
import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectYearAndTerm extends StatelessWidget {
  const SelectYearAndTerm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: CustomDropDownButton(
              hint: AppConstLang.addYear.tr,
              enabled: true,
              items: controller.argument.thisModel == null
                  ? controller.availableYears()
                  : [controller.year ?? ""],
              onChanged: controller.onYearChanged,
              value: controller.year,
            ),
          ),
          Flexible(
            child: CustomDropDownButton(
              hint: AppConstLang.addSemester.tr,
              enabled: true,
              items: controller.argument.thisModel is! SemesterModel
                  ? controller.availableSemesters()
                  : [controller.semester ?? ""],
              onChanged: controller.onSemesterChanged,
              value: controller.semester,
            ),
          ),
        ],
      ),
    );
  }
}
