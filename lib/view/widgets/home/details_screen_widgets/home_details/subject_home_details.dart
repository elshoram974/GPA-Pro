import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:gpa_pro/core/shared/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectsHomeDetails extends StatelessWidget {
  const SubjectsHomeDetails({
    super.key,
    required this.allSubjects,
    required this.arguments,
  });
  final GPAFunctionsHelper allSubjects;
  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDivider(data: AppConstLang.theSubjects.tr),
        MyTextSpan(
          "${AppConstLang.numberOfCalcSubject.tr}:",
          "${allSubjects.calculatedLength()}",
        ),
        MyTextSpan(
          "${AppConstLang.numberOfNotCalcSubject.tr}:",
          "${allSubjects.notCalculatedLength()}",
        ),
        const SizedBox(height: AppConstant.kDefaultPadding / 2),
        SizedBox(
          width: double.infinity,
          child: MyTextSpan(
            "${AppConstLang.totalNumberOfSubjects.tr}:",
            "${allSubjects.modelList.length}",
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
