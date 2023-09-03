import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:gpa_pro/core/shared/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GPAAddDetails extends StatelessWidget {
  const GPAAddDetails(
      {super.key, required this.arguments, required this.allSubjects});
  final DetailsArguments arguments;
  final GPAFunctionsHelper allSubjects;

  @override
  Widget build(BuildContext context) {
    GPAFunctionsHelper modelFunctions = GPAFunctionsHelper(arguments.modelList);
    GPAFunctionsHelper allWithModel =
        GPAFunctionsHelper(arguments.moreSubjects!);

    return Column(
      children: [
        CustomDivider(data: AppConstLang.theCumulative.tr),
        MyTextSpan(
          "GPA:",
          "${modelFunctions.gpaCumulative()}",
        ),
        MyTextSpan(
          "${AppConstLang.theCumulative.tr}:",
          "${allSubjects.gpaCumulative()}",
        ),
        const SizedBox(height: AppConstant.kDefaultPadding / 2),
        SizedBox(
          width: double.infinity,
          child: MyTextSpan(
            "${AppConstLang.theCumulativeWithAdded.tr}:",
            "${allWithModel.gpaCumulative()}",
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
