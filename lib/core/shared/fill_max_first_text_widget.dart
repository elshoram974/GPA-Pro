import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FillMaxFirstTextWidget extends StatelessWidget {
  const FillMaxFirstTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MyTextSpan(
      "${AppConstLang.notice.tr}:",
      AppConstLang.fillMaxBeforeDegrees.tr,
      textScaleFactor: 0.9,
    );
  }
}
