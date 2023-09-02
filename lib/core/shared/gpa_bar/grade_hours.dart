import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/functions/my_bottom_sheets.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradeAndHours extends StatelessWidget {
  const GradeAndHours({
    super.key,
    required this.arguments,
    required this.modelFunctions,
  });

  final DetailsArguments arguments;
  final GPAFunctionsHelper modelFunctions;

  @override
  Widget build(BuildContext context) {
    String grade = modelFunctions.grade();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 10,
          child: FittedBox(
            child: MyTextSpan(
              "${AppConstLang.grade.tr}:",
              grade,
              textAlign: TextAlign.center,
              onTap: () => AppBottomSheets.openDetails(arguments),
            ),
          ),
        ),
        const Spacer(flex: 4),
        Expanded(
          flex: 10,
          child: FittedBox(
            child: MyTextSpan(
              "${arguments.realizedHours == null ? AppConstLang.noHour.tr : AppConstLang.totalHours.tr}:",
              "${modelFunctions.noHours() + (arguments.realizedHours ?? 0)}",
              textAlign: TextAlign.center,
              onTap: () => AppBottomSheets.openDetails(arguments),
            ),
          ),
        ),
      ],
    );
  }
}
