import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/functions/my_bottom_sheets.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/gpa_bar/gpa_text.dart';
import 'package:gpa_pro/core/shared/gpa_bar/grade_hours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GPABarBody extends StatelessWidget {
  const GPABarBody({
    super.key,
    required this.modelFunctions,
    required this.arguments,
  });

  final GPAFunctionsHelper modelFunctions;
  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    double gpa = modelFunctions.gpaCumulative().toPrecision(3);

    return GestureDetector(
      onVerticalDragStart: (details) => AppBottomSheets.openDetails(arguments),
      onTap: () => AppBottomSheets.openDetails(arguments),
      child: Tooltip(
        message: AppConstLang.tapToSeeMore.tr,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: context.isDarkMode
                ? const [BoxShadow(blurRadius: 0.5)]
                : const [BoxShadow(blurRadius: 0.5, color: Colors.black54)],
            color: modelFunctions.color(context, inList: false),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: GPAText(arguments: arguments, gpa: gpa)),
              Expanded(
                child: GradeAndHours(
                  arguments: arguments,
                  modelFunctions: modelFunctions,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
