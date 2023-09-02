import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:gpa_pro/core/shared/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradeAddDetails extends StatelessWidget {
  const GradeAddDetails({
    super.key,
    required this.allSubjects,
    required this.arguments,
  });
  final DetailsArguments arguments;
  final GPAFunctionsHelper allSubjects;

  @override
  Widget build(BuildContext context) {
    GPAFunctionsHelper modelFunctions = GPAFunctionsHelper(arguments.modelList);
    GPAFunctionsHelper allWithModel =
        GPAFunctionsHelper(arguments.moreSubjects!);

    return Column(
      children: [
        CustomDivider(data: AppConstLang.grade.tr),
        MyTextSpan("${AppConstLang.grade.tr}:", modelFunctions.grade()),
        MyTextSpan(
            "${AppConstLang.gradeOfCumulative.tr}:", allSubjects.grade()),
        SizedBox(height: AppConstant.kDefaultPadding / 2),
        SizedBox(
          width: double.infinity,
          child: MyTextSpan(
            "${AppConstLang.gradeOfAllWithAdded.tr}:",
            allWithModel.grade(),
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: AppConstant.kDefaultPadding),
      ],
    );
  }
}
