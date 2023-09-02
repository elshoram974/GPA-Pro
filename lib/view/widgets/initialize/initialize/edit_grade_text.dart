import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditGradeText extends StatelessWidget {
  const EditGradeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppConstant.kDefaultPadding / 2),
        MyTextSpan(
          textAlign: TextAlign.center,
          AppConstLang.editGrades.tr,
          "\n\n${AppConstLang.exampleInGrade.tr}",
          boldStyle: context.textTheme.titleLarge,
          styleToDefault: context.textTheme.bodyLarge,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
