import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectDivider extends StatelessWidget {
  const SubjectDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        CustomDivider(data: AppConstLang.subject.tr),
        const SizedBox(height: 10),
      ],
    );
  }
}
