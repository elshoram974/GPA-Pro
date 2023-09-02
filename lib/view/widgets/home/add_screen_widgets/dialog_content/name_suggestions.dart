import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameSuggestions extends StatelessWidget {
  const NameSuggestions({
    super.key,
    required this.subject,
    required this.isArabic,
  });

  final SubjectModel subject;
  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.5),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: AppConstant.kDefaultPadding / 2),
          tileColor: GPAFunctionsHelper([subject]).color(context),
          title: Text(
            isArabic ? subject.nameAr ?? subject.nameEn : subject.nameEn,
            style: context.textTheme.bodySmall,
          ),
          trailing: Text(
            "GPA: ${subject.gpa}",
            style: context.textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
