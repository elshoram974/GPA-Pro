import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/functions/my_bottom_sheets.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GPAText extends StatelessWidget {
  const GPAText({
    super.key,
    required this.arguments,
    required this.gpa,
  });

  final DetailsArguments arguments;
  final double gpa;

  @override
  Widget build(BuildContext context) {
    double cumulative = GPAFunctionsHelper(arguments.moreSubjects ?? [])
        .gpaCumulative()
        .toPrecision(3);
    return Row(
      children: [
        Expanded(
          child: FittedBox(
            child: MyTextSpan(
              arguments.pageType == PageType.homeScreen
                  ? "${AppConstLang.theCumulative.tr}:"
                  : "GPA: ",
              "$gpa",
              onTap: () => AppBottomSheets.openDetails(arguments),
            ),
          ),
        ),
        Visibility(
          visible: arguments.moreSubjects != null,
          child: Expanded(
            child: FittedBox(
              child: MyTextSpan(
                "${AppConstLang.theCumulative.tr}:",
                "$cumulative",
                onTap: () => AppBottomSheets.openDetails(arguments),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
