import 'package:gpa_pro/core/functions/gpa_functions.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTrailing extends StatelessWidget {
  const CardTrailing({super.key, required this.model, this.onTap});

  final ParentModel model;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 75,
          child: FittedBox(
            child: MyTextSpan(
              "${AppConstLang.grade.tr}:",
              model is SubjectModel
                  ? GPAFunctions.gradeResult(
                      "${model.percentageDegree}",
                      GradeType.degree,
                      model.hours,
                    )
                  : GPAFunctions.gradeResult(
                      "${model.gpa}",
                      GradeType.gpa,
                      model.hours,
                    ),
              onTap: onTap,
            ),
          ),
        ),
        SizedBox(
          height: 22.5,
          child: FittedBox(
            child: MyTextSpan(
              "GPA: ",
              "${model.gpa.toPrecision(3)}",
              textScaleFactor: 1.2,
              textAlign: TextAlign.center,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
