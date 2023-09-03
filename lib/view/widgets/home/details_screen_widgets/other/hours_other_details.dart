import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:gpa_pro/core/shared/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoursOtherDetails extends StatelessWidget {
  const HoursOtherDetails({
    super.key,
    required this.allSubjects,
    required this.modelFn,
  });
  final GPAFunctionsHelper allSubjects;
  final GPAFunctionsHelper modelFn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDivider(data: AppConstLang.noHour.tr),
        MyTextSpan(
          "${AppConstLang.noHour.tr}:",
          "${modelFn.noHours()}",
        ),
        const SizedBox(height: AppConstant.kDefaultPadding / 2),
        SizedBox(
          width: double.infinity,
          child: MyTextSpan(
            "${AppConstLang.totalHours.tr}:",
            "${AppInjections.homeController.releaseHours + allSubjects.noHours()}",
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
