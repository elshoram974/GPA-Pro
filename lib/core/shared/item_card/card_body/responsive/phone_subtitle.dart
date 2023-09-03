import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubTitleInPhone extends StatelessWidget {
  final ParentModel model;
  final void Function()? onTap;

  const SubTitleInPhone({super.key, required this.model, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: SizedBox(
            width: 90,
            child: FittedBox(
              child: MyTextSpan(
                "${AppConstLang.noHour.tr}:",
                "${model.hours}",
                onTap: onTap,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppConstant.kDefaultPadding),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: FittedBox(
                  child: MyTextSpan(
                    "${AppConstLang.totalGPA.tr}: ",
                    "${model.totalGPA.toPrecision(1)}",
                    textAlign: TextAlign.center,
                    onTap: onTap,
                  ),
                ),
              ),
              Flexible(
                child: FittedBox(
                  child: MyTextSpan(
                    "${AppConstLang.degree.tr}: ",
                    model is SubjectModel
                        ? "${model.percentageDegree!.toPrecision(1)} %"
                        : "${model.degree.toPrecision(2)}",
                    textAlign: TextAlign.center,
                    onTap: onTap,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppConstant.kDefaultPadding / 2),
      ],
    );
  }
}
