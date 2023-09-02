import 'package:gpa_pro/controller/home/subject_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectTotalGPAPercentage extends StatelessWidget {
  const SubjectTotalGPAPercentage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubjectControllerImp>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: FittedBox(
              child: MyTextSpan(
                "${AppConstLang.totalGPA.tr}:",
                "${controller.getTotalGpa()}",
              ),
            ),
          ),
          SizedBox(width: AppConstant.kDefaultPadding / 2),
          Flexible(
            child: FittedBox(
              child: MyTextSpan(
                "${AppConstLang.degree.tr}:",
                "${controller.getPercentageDegree()} %",
              ),
            ),
          ),
        ],
      );
    });
  }
}
