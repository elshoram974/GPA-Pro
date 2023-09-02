import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/my_text_span.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RealizedHours extends StatelessWidget {
  const RealizedHours({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 3,
          child: MyTextSpan(
            AppConstLang.realizedHours.tr,
            "\n${AppConstLang.thatNotCalcInCumulative.tr}",
            fontSize: 17,
          ),
        ),
        Expanded(
          flex: 2,
          child: MyDefaultField(
            isDouble: true,
            initialValue: "${AppInjections.homeController.releaseHours}",
            validator: AppInjections.homeController.validHours,
            onChanged: AppInjections.homeController.setRealizedHours,
          ),
        ),
      ],
    );
  }
}
