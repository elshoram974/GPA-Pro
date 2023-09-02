import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:gpa_pro/core/shared/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GPAOtherDetails extends StatelessWidget {
  const GPAOtherDetails({
    super.key,
    required this.modelFn,
    required this.allSubjects,
  });
  final GPAFunctionsHelper allSubjects;
  final GPAFunctionsHelper modelFn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDivider(data: AppConstLang.theCumulative.tr),
        MyTextSpan(
          "GPA:",
          "${modelFn.gpaCumulative()}",
        ),
        SizedBox(height: AppConstant.kDefaultPadding / 2),
        SizedBox(
          width: double.infinity,
          child: MyTextSpan(
            "${AppConstLang.theCumulative.tr}:",
            "${allSubjects.gpaCumulative()}",
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
