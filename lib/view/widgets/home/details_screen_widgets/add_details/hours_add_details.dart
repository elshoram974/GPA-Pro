import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:gpa_pro/core/shared/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoursAddDetails extends StatelessWidget {
  const HoursAddDetails({
    super.key,
    required this.allSubjects,
    required this.arguments,
  });
  final GPAFunctionsHelper allSubjects;
  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    GPAFunctionsHelper addModel = GPAFunctionsHelper(arguments.modelList);
    int allSavedHours = AppInjections.homeController.releaseHours;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDivider(data: AppConstLang.noHour.tr),
        MyTextSpan(
          "${AppConstLang.noHour.tr}:",
          "${addModel.noHours()}",
        ),
        MyTextSpan(
          "${AppConstLang.registeredHours.tr}:",
          "${allSavedHours + allSubjects.noHours()}",
        ),
        const SizedBox(height: AppConstant.kDefaultPadding / 2),
        SizedBox(
          width: double.infinity,
          child: MyTextSpan(
            "${AppConstLang.totalHours.tr}:",
            "${allSavedHours + allSubjects.noHours() + addModel.noHours()}",
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
