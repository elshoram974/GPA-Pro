import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:gpa_pro/core/shared/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectsOtherDetails extends StatelessWidget {
  const SubjectsOtherDetails({super.key, required this.modelFn});
  final GPAFunctionsHelper modelFn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDivider(data: AppConstLang.theSubjects.tr),
        MyTextSpan(
          "${AppConstLang.numberOfCalcSubject.tr}:",
          "${modelFn.calculatedLength()}",
        ),
        MyTextSpan(
          "${AppConstLang.numberOfNotCalcSubject.tr}:",
          "${modelFn.notCalculatedLength()}",
        ),
        const SizedBox(height: AppConstant.kDefaultPadding / 2),
        SizedBox(
          width: double.infinity,
          child: MyTextSpan(
            "${AppConstLang.totalNumberOfSubjects.tr}:",
            "${modelFn.modelList.length}",
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
