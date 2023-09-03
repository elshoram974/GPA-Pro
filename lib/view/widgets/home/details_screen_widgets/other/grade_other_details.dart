import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:gpa_pro/core/shared/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradeOtherDetails extends StatelessWidget {
  const GradeOtherDetails({
    super.key,
    required this.allSubjects,
    required this.modelFn,
  });
  final GPAFunctionsHelper modelFn;
  final GPAFunctionsHelper allSubjects;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDivider(data: AppConstLang.grade.tr),
        MyTextSpan("${AppConstLang.grade.tr}:", modelFn.grade()),
        const SizedBox(height: AppConstant.kDefaultPadding / 2),
        SizedBox(
          width: double.infinity,
          child: MyTextSpan(
            "${AppConstLang.gradeOfCumulative.tr}:",
            allSubjects.grade(),
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: AppConstant.kDefaultPadding),
      ],
    );
  }
}
