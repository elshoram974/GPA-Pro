import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_divider.dart';
import 'package:gpa_pro/view/widgets/initialize/initialize/buttons_initialize.dart';
import 'package:gpa_pro/view/widgets/initialize/initialize/edit_grade_text.dart';
import 'package:gpa_pro/view/widgets/initialize/initialize/initialize_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradesView extends StatelessWidget {
  const GradesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomDivider(data: AppConstLang.grades.tr),
        const EditGradeText(),
        const InitializeGradeTable(),
        const SizedBox(height: AppConstant.kDefaultPadding),
        const InitializeButton(),
        const SizedBox(height: 40),
      ],
    );
  }
}
